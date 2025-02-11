package com.e.d.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.CommentRepository;
import com.e.d.model.repository.LikeRepository;
import com.e.d.model.repository.MemberRepository;
import com.e.d.model.service.BoardService;
import com.e.d.model.service.CommentService;
import com.e.d.model.service.LikeService;
import com.e.d.model.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class MainController {
	
	private final BoardRepository boardRepository;
	private final CommentRepository commentRepository;
	private final LikeRepository likeRepository;
	private final MemberRepository memberRepository;
	
	private final BoardService boardService;
	private final CommentService commentService;
	private final LikeService likeService;
	private final MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	protected void ipPrint() {
	    HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	    String ip = req.getHeader("x-forwarded-for");
	    if (ip == null || ip.isEmpty()) {
	        ip = req.getRemoteAddr();
	        if (ip.equals("0:0:0:0:0:0:0:1")) {
	            try {
	                ip = InetAddress.getLocalHost().getHostAddress();
	            } catch (UnknownHostException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    
	    log.info("클라이언트 IP : {}", ip);
	    log.info("클라이언트 브라우저 : {}", parseBrowserInfo(req.getHeader("User-Agent")));
	}

	protected String parseBrowserInfo(String userAgent) {
	    String browserName = "";
	    String version = "";
	    
	    userAgent = userAgent.toLowerCase();
	    
	    if (userAgent.contains("chrome") && !userAgent.contains("edg")) {
	        browserName = "구글 크롬";
	        version = extractVersion(userAgent, "chrome/");
	    } else if (userAgent.contains("safari") && !userAgent.contains("chrome")) {
	        browserName = "사파리";
	        version = extractVersion(userAgent, "version/");
	    } else if (userAgent.contains("firefox")) {
	        browserName = "파이어폭스";
	        version = extractVersion(userAgent, "firefox/");
	    } else if (userAgent.contains("edg")) {
	        browserName = "엣지";
	        version = extractVersion(userAgent, "edg/");
	    } else {
	        browserName = "기타 브라우저";
	    }
	    
	    return version.isEmpty() ? browserName : browserName + " " + version;
	}

	protected String extractVersion(String userAgent, String keyword) {
	    int start = userAgent.indexOf(keyword) + keyword.length();
	    int end = userAgent.indexOf(" ", start);
	    
	    if (end == -1) end = userAgent.length();
	    
	    return userAgent.substring(start, end);
	}
	
	@GetMapping("/")
	public String index(Model m) {
		ipPrint();
		m.addAttribute("boardRepoFindAll", boardRepository.findAllByOrderByBlogIdDesc());
		return "index";
	}
	
	@GetMapping("/search")
	public String searchPage() {
		return "search/search";
	}
	
	@GetMapping("/result")
	public String search(@RequestParam String qey, Model m) {
		m.addAttribute("searchResultLists", boardRepository.findByTitleContainingIgnoreCaseOrWriterContainingIgnoreCaseOrContentContainingIgnoreCaseOrCategoryContainingIgnoreCase(qey, qey, qey, qey));
		m.addAttribute("searchWord", qey);
		return "search/searchResult";
	}
	
	@GetMapping("/signup")
	public String signupPage() {
		return "user/signup";
	}
	
	@GetMapping("/signin")
	public String signinPage() {
		return "user/login";
	}
	
	@PostMapping("/signupF")
	public String signupF(@RequestParam String username,
			@RequestParam String useremail,
			@RequestParam String userpassword,
			@RequestParam String dateTime,
			@RequestParam String bio,
			@RequestParam MultipartFile profile,
			HttpSession session, Model m) {
		try {
			memberService.signup(username, useremail, dateTime, userpassword, bio, profile, session);
			m.addAttribute("success", "회원가입에 성공했습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("success", "회원가입에 실패했습니다.");
		}
		return "success/signupSuccess";
	}
	
	@PostMapping("/login")
    public String login(@RequestParam String username,
    		@RequestParam String userpassword,
            HttpSession session,
            Model model) {
        // 로그인 시도 로그
        log.info("사용자 {} 로그인 시도", username);

        // 사용자 정보 조회
        MemberEntity member = memberRepository.findByUsername(username);

        // 사용자 존재 여부 확인
        if (member == null) {
            log.warn("사용자 {}를 찾을 수 없습니다.", username);
            model.addAttribute("error", "사용자를 찾을 수 없습니다.");
            return "login"; // 로그인 페이지로 돌아감
        }

        // 비밀번호 비교
        if (passwordEncoder.matches(userpassword, member.getUserpassword())) {
            // 세션에 사용자 정보 저장
            session.setAttribute("user", member);
            log.info("사용자 {}가 성공적으로 로그인하였습니다.", username);
            return "redirect:/"; // 성공적으로 로그인한 후 홈으로 리다이렉트
        } else {
            log.warn("사용자 {}의 비밀번호가 틀렸습니다.", username);
            model.addAttribute("error", "비밀번호가 틀렸습니다.");
            return "login"; // 비밀번호가 틀린 경우 로그인 페이지로 돌아감
        }
    }
	
	@PostMapping("/logout")
	public String logout(HttpSession session, @RequestParam long memberId) {
		MemberEntity u = (MemberEntity) session.getAttribute("user");
		if (u != null && u.getMemberId() == memberId) session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/write")
	public String writePage(HttpSession session) {
		return session.getAttribute("user") == null ? "user/login" : "blog/write";
	}
	
	@PostMapping("/boardWrite")
	public String write(@RequestParam String title,
			@RequestParam String content,
			@RequestParam String category,
			@RequestParam String dateTime,
			@RequestParam MultipartFile img,
			@RequestParam MultipartFile video,
			HttpSession session) throws IllegalStateException, IOException, UnsupportedEncodingException {
		MemberEntity u = (MemberEntity) session.getAttribute("user");
		
		if (img.isEmpty() && video.isEmpty()) {
			boardService.boardWrite1(title, u.getMemberId(), u.getUsername(), content, category, dateTime);
		} else if (!img.isEmpty() && video.isEmpty()) {
			boardService.boardWrite2(title, u.getMemberId(), u.getUsername(), content, category, dateTime, session, img);
		} else if (img.isEmpty() && !video.isEmpty()) {
			boardService.boardWrite3(title, u.getMemberId(), u.getUsername(), content, category, dateTime, session, video);
		} else if (!img.isEmpty() && !video.isEmpty()) {
			boardService.boardWrite4(title, u.getMemberId(), u.getUsername(), content, category, dateTime, session, img, video);
		}
		return "redirect:/blog/" + URLEncoder.encode(u.getUsername(), "UTF-8");
	}
	
	@GetMapping("/blog/{username}")
	public String profilePage(@PathVariable String username, Model m) {
		MemberEntity user = memberRepository.findByUsername(username);
		m.addAttribute("profileInfo", user);
		if (!boardRepository.findByWriterId(user.getMemberId()).isEmpty()) {
			m.addAttribute("profileUserBoard", boardRepository.findByWriterId(user.getMemberId()));
		}
		return "profile/profile";
	}
	
	@GetMapping("/blog/{username}/board")
	public String boardPage(@PathVariable String username,
			@RequestParam long id,
			HttpSession session, Model m) {
		if (session.getAttribute("user") != null) boardService.incrementBoardViews(id);
		m.addAttribute("writerInfo", memberRepository.findByUsername(username));
		m.addAttribute("commentList", commentRepository.findByBlogId(id));
		if (boardRepository.findById(id).isPresent()) m.addAttribute("boardInfo", boardRepository.findById(id).get());
		return "blog/board";
	}
	
	@PostMapping("/blog/{username}/board/delete")
	public String boardDelete(@PathVariable String username, @RequestParam long blogId) throws UnsupportedEncodingException {
		boardService.boardDelete(blogId);
		return "redirect:/blog/" + URLEncoder.encode(username, "UTF-8");
	}
	
	@PostMapping("/blog/{username}/board/edit")
	public String boardEditPage(@PathVariable String username, @RequestParam long blogId, Model m) {
	    boardRepository.findById(blogId).ifPresent(entity -> m.addAttribute("editedBoardInfo", entity));
	    return "blog/edit";
	}
	
	@PostMapping("/boardEdit")
	public String boardEdit(@RequestParam long blogId,
			@RequestParam String title,
			@RequestParam long writerId,
			@RequestParam String writer,
			@RequestParam String writerProfile,
			@RequestParam long views,
			@RequestParam long likes,
			@RequestParam long commentCount,
			@RequestParam String content,
			@RequestParam String category,
			@RequestParam String dateTime,
			@RequestParam MultipartFile img,
			@RequestParam MultipartFile video,
			HttpSession session) throws IllegalStateException, IOException {
		boardService.boardEditFunctionThatsServiceLayerFunc(blogId, title, writerId, writer, writerProfile, views, likes, commentCount, content, category, dateTime, img, video, session);
		return "redirect:/blog/" + URLEncoder.encode(writer, "UTF-8") + "/board?id=" + blogId;
	}
	
	@Transactional
	@PostMapping("/addComment")
	public String addComment(@RequestParam long commenterId,
			@RequestParam String commenterProfile,
	        @RequestParam String commentContent,
	        @RequestParam long blogWriterId,
	        @RequestParam String dateTime,
	        @RequestParam long blogId,
	        @RequestParam String commenterName) throws UnsupportedEncodingException {
	    commentService.addComment(commenterId, commenterName, commenterProfile, commentContent, blogWriterId, blogId, dateTime);
	    BoardEntity board = boardRepository.findById(blogId).orElse(null);
	    return "redirect:/blog/" + (board != null ? URLEncoder.encode(board.getWriter(), "UTF-8") : "") + "/board?id=" + blogId;
	}
	

	
}