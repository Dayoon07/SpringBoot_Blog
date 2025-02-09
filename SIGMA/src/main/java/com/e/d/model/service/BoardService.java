package com.e.d.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.CommentRepository;
import com.e.d.model.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardService {

	private final BoardRepository repository;
	private final CommentRepository commentRepository;
	private final MemberRepository memberRepository;

	/** <p>이미지와 영상이 둘 다 없을 때 </p> */
	public BoardEntity boardWrite1(String title, long writerId, String writer, 
			String content, String category, String dateTime) {
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile())
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.build();
		
		return repository.save(entity);
	}
	
	/** <p>이미지 파일만 있을 때 </p> */
	public BoardEntity boardWrite2(String title, long writerId, String writer, 
			String content, String category, String dateTime, HttpSession session,
			MultipartFile img) throws IllegalStateException, IOException {
		String uploadDir = session.getServletContext().getRealPath("/resources/blog-img/");
		String extension = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists()) dir.mkdirs();
		
		img.transferTo(new File(uploadDir + fileName));
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile())
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.img("/resources/blog-img/" + fileName)
				.build();
		
		return repository.save(entity);
	}
	
	/** <p>영상 파일만 있을 때 </p> */
	public BoardEntity boardWrite3(String title, long writerId, String writer, 
			String content, String category, String dateTime, HttpSession session,
			MultipartFile video) throws IllegalStateException, IOException {
		String uploadDir = session.getServletContext().getRealPath("/resources/blog-video/");
		String extension = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists()) dir.mkdirs();
		
		video.transferTo(new File(uploadDir + fileName));
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile())
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.video("/resources/blog-video/" + fileName)
				.build();
		
		return repository.save(entity);
	}
	
	/** <p>이미지와 영상이 둘다 있을 때 </p> */
	public BoardEntity boardWrite4(String title, long writerId, String writer, 
			String content, String category, String dateTime, HttpSession session,
			MultipartFile img, MultipartFile video) throws IllegalStateException, IOException {
		String videoUploadDir = session.getServletContext().getRealPath("/resources/blog-video/");
		String imgUploadDir = session.getServletContext().getRealPath("/resources/blog-img/");
		
		String videoExtension = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
		String imgExtension  = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
		
		String videoFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + videoExtension;
		String imgFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + imgExtension;
		
		File videoDir = new File(videoUploadDir);
		File imgDir = new File(imgUploadDir);
		
		if (!videoDir.exists()) videoDir.mkdirs();
		if (!imgDir.exists()) imgDir.mkdirs();
		
		video.transferTo(new File(videoUploadDir + videoFileName));
		img.transferTo(new File(imgUploadDir + imgFileName));
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile())
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.img("/resources/blog-img/" + imgFileName)
				.video("/resources/blog-video/" + videoFileName)
				.build();
		
		return repository.save(entity);
	}
	
	public void incrementBoardViews(long blogId) {
		BoardEntity board = repository.findById(blogId).get();
		board.setViews(board.getViews() + 1);
		board.setCommentCount(commentRepository.findByBlogWriterId(blogId).size());
		repository.save(board);
	}
	
	public void commentCnt(long blogId, int n) {
		BoardEntity board = BoardEntity.builder()
				.blogId(blogId)
				.title(repository.findById(blogId).get().getTitle())
				.writerId(repository.findById(blogId).get().getWriterId())
				.writer(repository.findById(blogId).get().getWriter())
				.writerProfile(repository.findById(blogId).get().getWriterProfile())
				.content(repository.findById(blogId).get().getContent())
				.views(repository.findById(blogId).get().getViews())
				.likes(repository.findById(blogId).get().getLikes())
				.category(repository.findById(blogId).get().getCategory())
				.dateTime(repository.findById(blogId).get().getDateTime())
				.commentCount(n)
				.build();
		log.info("Saving board: {}", board);
		repository.save(board);
	}
	
}
