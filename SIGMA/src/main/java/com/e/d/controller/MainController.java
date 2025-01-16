package com.e.d.controller;

import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.e.d.model.entity.BlogImgEntity;
import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.CommentEntity;
import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.BlogImgRepository;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.CommentRepository;
import com.e.d.model.repository.MemberRepository;
import com.e.d.model.service.BlogImgService;
import com.e.d.model.service.BoardService;
import com.e.d.model.service.CommentService;
import com.e.d.model.service.MemberService;
import com.e.d.model.service.PagingService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BlogImgService blogImgService;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BlogImgRepository blogImgRepository;
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncode;
	
	@GetMapping("/")
	public String index(Model model,
	                    @RequestParam(defaultValue = "0") int page,
	                    @RequestParam(defaultValue = "20") int size) {
	    Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "blogid"));
	    Page<BoardEntity> blog = boardService.getBoardWithCommentCount(pageable);
	    
	    // 페이지네이션 정보 생성
	    String pageBar = pagingService.generatePageBar(blog, "/");

	    // 페이지네이션 메시지
	    String paginationInfo = "총 " + blog.getTotalElements() + "개의 글 중 " 
	                            + (page * size + 1) + "-" 
	                            + Math.min((page + 1) * size, blog.getTotalElements()) + "번째 글";
	    
	    model.addAttribute("pageBar", pageBar);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("findAllBlogs", blog.getContent());
	    return "index";
	}
	
	@GetMapping("signin")
	String signin() {
		return "user/signin";
	}

	@GetMapping("signup")
	String signup() {
		return "user/signup";
	}
	
	@PostMapping("/login")
	String signinForm(
			@RequestParam String username,
			@RequestParam String userpassword,
			HttpSession session) {
		Optional<MemberEntity> user = memberRepository.findByUsernameAndUserpassword(username, userpassword);
		
		if (!username.isEmpty() && user.get().getUsername().equals(username)) {
			if (!userpassword.isEmpty() && user.get().getUserpassword().equals(userpassword)) {
				session.setAttribute("userSession", user.get());
			}
		}
		return "redirect:/";
	}
	
	@PostMapping("/signupForm")
	String signupForm(@ModelAttribute MemberEntity entity) {
		try {
			if (entity.getJoindate() != null) {
				memberRepository.save(entity);
			} else {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
				entity.setJoindate(LocalDateTime.now().format(formatter));
				memberRepository.save(entity);
			}
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@PostMapping("/logout")
	String logout(@RequestParam long memberid, HttpSession session) {
	    MemberEntity user = (MemberEntity) session.getAttribute("userSession");
	    
	    if (user != null && user.getMemberid() == memberid) {
	    	try {
	    		session.invalidate(); // 세션 무효화
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    return "redirect:/";
	}
	
	@GetMapping("/profile")
	public String userProfile(
			@RequestParam String username,
			@RequestParam long memberid, Model model) {
	    if (username == null || username.isEmpty()) {
	        model.addAttribute("UserNotFoundErrorMessage", "존재하지 않는 유저이거나 삭제된 유저입니다.");
	        return "e/UserNotFound";
	    }

	    Optional<MemberEntity> member = memberRepository.findByUsername(username);
	    List<BoardEntity> memberOfBlog = boardRepository.findByWriter(member.get().getUsername());
	    
	    
	    if (member.isPresent()) {
	        model.addAttribute("userProfileList", member.get());
	        model.addAttribute("userProfileName", member.get().getUsername().trim().toUpperCase().substring(0, 1));
	        model.addAttribute("userProfileBoardBlog", memberOfBlog);
	        return "user/profile";
	    } else {
	        model.addAttribute("UserNotFoundErrorMessage", "존재하지 않는 유저이거나 삭제된 유저입니다.");
	        return "e/UserNotFound";
	    }
	}
	
	@GetMapping("/board/write")
	String writeBoard(HttpSession session) {
		MemberEntity member = (MemberEntity) session.getAttribute("userSession");
		if (member != null) {
			return "board/write";
		} else {
			return "user/signup";
		}
	}
	
	@PostMapping("/createPost")
	String createBoard(@ModelAttribute BoardEntity board,
			@RequestParam("filepath") MultipartFile filepath,
			HttpSession session) {
		
		String uploadDir = "C:/blogProjectImg/";
	    String fileName = filepath.getOriginalFilename();
		
		try {
			// 디렉토리가 없으면 생성 (Java IO)
	        File dir = new File(uploadDir);
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }
			if (board.getDatetime() == null) {
				board.setDatetime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분")));
			} else {
				boardRepository.save(board);
			}
			boardRepository.save(board);
			if (fileName != null) {
			    // 파일 이름 중복 방지 로직
			    String originalFileName = fileName;
			    String fileExtension = ""; // 확장자 저장 변수
			    if (fileName.contains(".")) {
			        int dotIndex = fileName.lastIndexOf(".");
			        fileExtension = fileName.substring(dotIndex); // 확장자 추출
			        originalFileName = fileName.substring(0, dotIndex); // 확장자 제외한 파일 이름
			    }

			    File newFile = new File(uploadDir + fileName);
			    int count = 1;

			    // 파일 이름 중복 확인 및 새 이름 생성
			    while (newFile.exists()) {
			        fileName = originalFileName + "(" + count + ")" + fileExtension;
			        newFile = new File(uploadDir + fileName);
			        count++;
			    }

			    // 파일 저장
			    filepath.transferTo(newFile);

			    // BlogImgEntity 저장
			    BlogImgEntity img = BlogImgEntity.builder()
			        .blogValue(board.getBlogid())
			        .filepath("/blogProjectImg/" + fileName) // 상대 경로로 설정
			        .filename(fileName)
			        .createAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a HH시 mm분 ss초")))
			        .build();

			    blogImgRepository.save(img);
			} else {   
	        	
	        }
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	@GetMapping("/blog/board")
	String particularBoard(@RequestParam long blogid,
	                       @RequestParam String writer,
	                       @RequestParam String title,
	                       HttpSession session,
	                       Model model) {
	    Optional<BoardEntity> optionalBlog = boardRepository.findById(blogid);
	    MemberEntity member = (MemberEntity) session.getAttribute("userSession");

	    // 존재하지 않는 글 처리
	    if (!optionalBlog.isPresent()) {
	        model.addAttribute("NotFoundBlog", "존재하지 않는 글입니다.");
	        return "e/NotFoundBlog";
	    }
	    
	    Optional<BlogImgEntity> img = blogImgRepository.findById(blogid);

	    BoardEntity blog = optionalBlog.get();
	    List<CommentEntity> comments = commentRepository.findByCommentasblogidOrderByCommentidDesc(blogid);

	    // 글쓴이 정보 조회
	    Optional<MemberEntity> optionalWriter = memberRepository.findByUsername(blog.getWriter());
	    MemberEntity blogWriterInfo = optionalWriter.orElse(null); // 존재하지 않을 경우 null

	    // 조회수 증가 (로그인한 사용자만)
	    if (member != null) {
	        blog.incrementViews();
	        boardRepository.save(blog);
	    }
	    
	    // 모델에 값 추가
	    model.addAttribute("allComment", comments);
	    model.addAttribute("commentSize", comments.size());
	    model.addAttribute("particularBlog", blog);
	    model.addAttribute("blogWriterInfo", blogWriterInfo); // Optional에서 추출한 값
	    model.addAttribute("particularBlogAndFindAllBlogs", boardRepository.findAll(Sort.by(Sort.Direction.DESC, "blogid")));
	    if (img.isPresent()) {
	    	model.addAttribute("img", img.get());
	    }

	    return "board/blog";
	}
	
	@PostMapping("/blogLike")
	String blogLike(HttpSession session, Model model,
			@RequestParam long blogid,
			@RequestParam String writer,
			@RequestParam String title) {
	    MemberEntity user = (MemberEntity) session.getAttribute("userSession");
	    if (user == null) {
	        model.addAttribute("errorMessage", "로그인이 필요합니다.");
	        return "redirect:/signin";
	    }
	    
	    try {
	    	String encodedWriter = URLEncoder.encode(writer, StandardCharsets.UTF_8.toString());
	    	String encodedTitle = URLEncoder.encode(title, StandardCharsets.UTF_8.toString());
	    	boardService.toggleLike(blogid, user.getMemberid());
		    return "redirect:/blog/board?blogid=" + blogid + "&writer=" + encodedWriter + "&title=" + encodedTitle;
		} catch (Exception e) {
			e.printStackTrace();
			return "e/error500";
		}
	}
	
	@PostMapping("/commentAdd")
	String addComment(
	        @RequestParam long blogid,
	        @RequestParam String writer,
	        @RequestParam String title,
	        @RequestParam String blogboardTitle,
	        @RequestParam String commenter,
	        @RequestParam String commentcontent, Model m) {
	    try {
	    	boardRepository.findById(blogid).orElseThrow(() -> new IllegalArgumentException("존재하지 않거나 삭제된 글입니다."));

	        CommentEntity addComment = CommentEntity.builder()
	                .blogboardTitle(blogboardTitle)
	                .commentasblogid(blogid)
	                .commenter(commenter)
	                .commentContent(commentcontent)
	                .commentDatetime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분")))
	                .build();

	        commentRepository.save(addComment);
	    } catch (IllegalArgumentException e) {
	        m.addAttribute("EmptyBlog", e.getMessage());
	        return "e/EmptyBlog";
	    } catch (Exception e) {
	        m.addAttribute("errorMessage", "댓글 저장 중 문제가 발생했습니다.");
	        return "e/Error";
	    }
	    return "redirect:/blog/board?blogid=" + blogid + 
	    	       "&writer=" + URLEncoder.encode(writer, StandardCharsets.UTF_8) + 
	    	       "&title=" + URLEncoder.encode(title, StandardCharsets.UTF_8);
	}
	
	@PostMapping("/deleteBlog")
	String deleteBlog(@RequestParam long blogid,
			@RequestParam String username,
			@RequestParam long memberid) {
		boardRepository.deleteById(blogid);
		return "redirect:/profile?username="+username+"&memberid="+memberid;
	}
	
	@PostMapping("changeBlog")
	String changeBlog(@RequestParam long blogid, Model m) {
		Optional<BoardEntity> myBlog = boardRepository.findById(blogid);
		Optional<BlogImgEntity> myBlogImg = blogImgRepository.findById(blogid);
		if (myBlog.isPresent()) {
			m.addAttribute("changeMyBlog", myBlog.get());
		}
		if (myBlogImg.isPresent()) {
			m.addAttribute("changeMyBlogImg", myBlogImg.get());
		}
		return "board/updateBlog";
	}
	
	@PostMapping("changeMyBlog")
	String changeMyBlog(@RequestParam long blogid, @ModelAttribute BoardEntity entity) {
		Optional<BoardEntity> list = boardRepository.findById(entity.getBlogid());
		
		if (list.isPresent()) {
			// System.out.println("수정 전 : " + list.get().getTitle() + "\n 수정 후 : " + entity.getTitle());
			BoardEntity titi = BoardEntity.builder()
					.blogid(entity.getBlogid())
					.title(entity.getTitle())
					.writer(entity.getWriter())
					.content(entity.getContent())
					.views(list.get().getViews())
					.likes(list.get().getLikes())
					.category(entity.getCategory())
					.datetime(entity.getDatetime())
					.commentCount(entity.getCommentCount())
					.likesByUser(entity.getLikesByUser())
					.build();
			
			boardRepository.save(titi);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/search")
	String search(@RequestParam String search_title, Model m) {
		List<BoardEntity> searchLists = boardRepository.searchByTitleIgnoreCaseContaining(search_title);
		m.addAttribute("searchLists", searchLists);
		return "board/search";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
