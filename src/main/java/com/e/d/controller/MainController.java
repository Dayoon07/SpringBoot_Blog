package com.e.d.controller;

import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e.d.model.service.BlogBoardService;
import com.e.d.model.service.BlogCommentService;
import com.e.d.model.service.BlogLikeService;
import com.e.d.model.service.BlogMemberService;
import com.e.d.model.service.NoticeService;
import com.e.d.model.vo.BlogBoardVo;
import com.e.d.model.vo.BlogMemberVo;
import com.e.d.model.vo.NoticeVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	private BlogBoardService blogBoardService;
	private BlogCommentService blogCommentService;
	private BlogLikeService blogLikeService;
	private BlogMemberService blogMemberService;
	private NoticeService noticeService;
	
	public MainController(
			BlogBoardService blogBoardService,
			BlogCommentService blogCommentService,
			BlogLikeService blogLikeService,
			BlogMemberService blogMemberService,
			NoticeService noticeService) {
		 this.blogBoardService = blogBoardService;
		 this.blogCommentService = blogCommentService;
		 this.blogLikeService = blogLikeService;
		 this.blogMemberService = blogMemberService;
		 this.noticeService = noticeService;
	}
	
	@GetMapping("/welcome")
	public String welcome() {
		return "welcome/welcome";
	}
	
	@GetMapping("/")
	public String index(Model model) {
		List<BlogBoardVo> list = blogBoardService.selectAllBlogs();
		model.addAttribute("defaultList", list);
		return "index";
	}
	
	@GetMapping("/signup")
	public String signUp() {
		return "member/signup";
	}
	
	@GetMapping("/signin")
	public String signIn() {
		return "member/signin";
	}
	
	@GetMapping("/blog")
	public String blog(Model model) {
		List<BlogBoardVo> blogList = blogBoardService.selectAllBlogs();
		model.addAttribute("blogList", blogList);
		return "blog/mainblogpage";
	}
	
	@GetMapping("/blog/write")
	public String blogWrite() {
		return "blog/blogwrite";
	}
	
	@PostMapping("/blogWrite")
	public String blogInsert(
			@RequestParam String writer,
			@RequestParam String title,
			@RequestParam String blogcontent) {
		blogBoardService.insertBlog(writer, title, blogcontent);
		return "redirect:/blog";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute BlogMemberVo blogMemberVo) {
		try {
			blogMemberService.insertBlogMember(blogMemberVo);
			System.out.println(blogMemberVo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("뭔진 모르겠지만 에러남");
		}
		return "redirect:/";
	}
	
	@PostMapping("/signin")
	public String signin(
			@RequestParam String username,
			@RequestParam String userpassword,
			HttpSession session) {
		BlogMemberVo loginuser = blogMemberService.selectLoginMember(username, userpassword);
		
		if (loginuser != null
				&& loginuser.getUsername().equals(username)
				&& loginuser.getUserpassword().equals(userpassword)
			) {
			System.out.println("방금 로그인한 유저의 고유 아이디는 " + loginuser.getUserId());
			session.setAttribute("loginuser", loginuser);
			return "redirect:/";
		} else {
			System.out.println("이메일이나 비번 둘 중 하나가 틀림");
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/username/{username}")
	public String userProfile(@PathVariable String username, Model model) {
		BlogMemberVo list = blogMemberService.selectAllMemberInfo(username);
		if (list == null) {
			model.addAttribute("NullUserException", "요청에 해당하는 유저가 없습니다.");
			return "user/NullUserE";
		} else model.addAttribute("userinfo", list);
		return "user/userprofile";
	}
	
	@GetMapping("/blog/blogview")
	public String blogMapping(@RequestParam int blogid, Model model) {
		model.addAttribute("blogNum", blogBoardService.selectBoardIdBlog(blogid));
		return "blog/blogview";
	}
	
	@PostMapping("/updateMemberInfo")
    public String updateMemberInfo(@ModelAttribute BlogMemberVo blogMemberVo) {
        blogMemberService.updateMemberInfo(blogMemberVo);
        return "index";
    }
	
	@PostMapping("/dropMemberInfo")
	public String deleteBlogmember(@RequestParam int userId, HttpSession session) {
	    blogMemberService.deleteBlogmember(userId);
	    session.invalidate();
	    return "index";
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/notice")
	public String notice(Model model) {
		List<NoticeVo> list = noticeService.selectAllNotice();
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 dd일");
		 list.forEach(notice -> {
			 String formattedDate = notice.getDateTime().format(formatter);
		     notice.setFormattedDate(formattedDate);
		 });
		model.addAttribute("noticeList", list);
		return "notice/notice";
	}
	
	@GetMapping("/notice/view")
	public String noticeView(@RequestParam int noticeid, Model model) {
		NoticeVo noticeView = noticeService.selectViewNotice(noticeid);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 dd일");
	    String formattedDate = noticeView.getDateTime().format(formatter);
	    noticeView.setFormattedDate(formattedDate);
		model.addAttribute("noticeView", noticeView);
		return "notice/noticeview";
	}
	
	
	
	
	
	
}
