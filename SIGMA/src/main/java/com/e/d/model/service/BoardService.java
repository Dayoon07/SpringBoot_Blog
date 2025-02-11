package com.e.d.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	
	/**
	 * <p>
	 * 이미지와 영상이 둘 다 없을 때
	 * </p>
	 */
	public BoardEntity boardWrite1(String title, long writerId, String writer, String content, String category,
			String dateTime) {

		BoardEntity entity = BoardEntity.builder().title(title).writerId(writerId).writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile()).content(content)
				.category(category).dateTime(dateTime).build();

		return repository.save(entity);
	}

	/**
	 * <p>
	 * 이미지 파일만 있을 때
	 * </p>
	 */
	public BoardEntity boardWrite2(String title, long writerId, String writer, String content, String category,
			String dateTime, HttpSession session, MultipartFile img) throws IllegalStateException, IOException {
		String uploadDir = session.getServletContext().getRealPath("/resources/blog-img/");
		String extension = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();

		img.transferTo(new File(uploadDir + fileName));

		BoardEntity entity = BoardEntity.builder().title(title).writerId(writerId).writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile()).content(content)
				.category(category).dateTime(dateTime).img("/resources/blog-img/" + fileName).build();

		return repository.save(entity);
	}

	/**
	 * <p>
	 * 영상 파일만 있을 때
	 * </p>
	 */
	public BoardEntity boardWrite3(String title, long writerId, String writer, String content, String category,
			String dateTime, HttpSession session, MultipartFile video) throws IllegalStateException, IOException {
		String uploadDir = session.getServletContext().getRealPath("/resources/blog-video/");
		String extension = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();

		video.transferTo(new File(uploadDir + fileName));

		BoardEntity entity = BoardEntity.builder().title(title).writerId(writerId).writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile()).content(content)
				.category(category).dateTime(dateTime).video("/resources/blog-video/" + fileName).build();

		return repository.save(entity);
	}

	/**
	 * <p>
	 * 이미지와 영상이 둘다 있을 때
	 * </p>
	 */
	public BoardEntity boardWrite4(String title, long writerId, String writer, String content, String category,
			String dateTime, HttpSession session, MultipartFile img, MultipartFile video)
			throws IllegalStateException, IOException {
		String videoUploadDir = session.getServletContext().getRealPath("/resources/blog-video/");
		String imgUploadDir = session.getServletContext().getRealPath("/resources/blog-img/");

		String videoExtension = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
		String imgExtension = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));

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

		BoardEntity entity = BoardEntity.builder().title(title).writerId(writerId).writer(writer)
				.writerProfile(memberRepository.findById(writerId).get().getProfile()).content(content)
				.category(category).dateTime(dateTime).img("/resources/blog-img/" + imgFileName)
				.video("/resources/blog-video/" + videoFileName).build();

		return repository.save(entity);
	}

	public void incrementBoardViews(long blogId) {
		BoardEntity board = repository.findById(blogId).get();
		board.setViews(board.getViews() + 1);
		board.setCommentCount(commentRepository.findByBlogWriterId(blogId).size());
		repository.save(board);
	}

	@Transactional
	public void boardDelete(long blogId) {
		log.info("게시글 삭제 요청: blogId = {}", blogId);
		repository.deleteById(blogId);
		commentRepository.deleteByBlogId(blogId);
		log.info("게시글 및 관련 댓글 삭제 완료: blogId = {}", blogId);
	}

	public void boardEditFunctionThatsServiceLayerFunc(long blogId, String title, long writerId, String writer,
	        String writerProfile, long views, long likes, long commentCount, String content, String category,
	        String dateTime, MultipartFile img, MultipartFile video, HttpSession session) throws IllegalStateException, IOException {

	    BoardEntity board = repository.findById(blogId).get();
	    String currentImgPath = board.getImg();
	    String currentVideoPath = board.getVideo();

	    // 기본 필드 업데이트
	    board.setBlogId(blogId);
	    board.setTitle(title);
	    board.setWriterId(writerId);
	    board.setWriter(writer);
	    board.setWriterProfile(writerProfile);
	    board.setContent(content);
	    board.setViews(views);
	    board.setLikes(likes);
	    board.setCategory(category);
	    board.setDateTime(dateTime);
	    board.setCommentCount(commentCount);

	    // 이미지 업데이트 처리
	    if (img != null && !img.isEmpty()) { // 새 이미지 업로드
	        String imgUploadDir = session.getServletContext().getRealPath("/resources/blog-img/");
	        String imgExtension = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
	        String imgFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
	                + UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + imgExtension;

	        // 디렉토리가 없으면 생성
	        File imgDir = new File(imgUploadDir);
	        if (!imgDir.exists()) {
	            imgDir.mkdirs();
	        }

	        // 기존 이미지가 있다면 삭제
	        if (currentImgPath != null && !currentImgPath.isEmpty()) {
	            File oldImg = new File(session.getServletContext().getRealPath(currentImgPath));
	            if (oldImg.exists()) {
	                oldImg.delete();
	            }
	        }

	        // 새 이미지 저장
	        img.transferTo(new File(imgUploadDir + imgFileName));
	        board.setImg("/resources/blog-img/" + imgFileName);

	    } else if (img != null && img.isEmpty() && currentImgPath != null && !currentImgPath.isEmpty()) { // 기존 이미지 삭제 요청
	        File oldImg = new File(session.getServletContext().getRealPath(currentImgPath));
	        if (oldImg.exists()) {
	            oldImg.delete();
	        }
	        board.setImg(null); // DB에서도 삭제
	    }

	    // 비디오 업데이트 처리
	    if (video != null && !video.isEmpty()) { // 새 비디오 업로드
	        String videoUploadDir = session.getServletContext().getRealPath("/resources/blog-video/");
	        String videoExtension = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
	        String videoFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
	                + UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + videoExtension;

	        // 디렉토리가 없으면 생성
	        File videoDir = new File(videoUploadDir);
	        if (!videoDir.exists()) {
	            videoDir.mkdirs();
	        }

	        // 기존 비디오가 있다면 삭제
	        if (currentVideoPath != null && !currentVideoPath.isEmpty()) {
	            File oldVideo = new File(session.getServletContext().getRealPath(currentVideoPath));
	            if (oldVideo.exists()) {
	                oldVideo.delete();
	            }
	        }

	        // 새 비디오 저장
	        video.transferTo(new File(videoUploadDir + videoFileName));
	        board.setVideo("/resources/blog-video/" + videoFileName);

	    } else if (video != null && video.isEmpty() && currentVideoPath != null && !currentVideoPath.isEmpty()) { // 기존 비디오 삭제 요청
	        File oldVideo = new File(session.getServletContext().getRealPath(currentVideoPath));
	        if (oldVideo.exists()) {
	            oldVideo.delete();
	        }
	        board.setVideo(null); // DB에서도 삭제
	    }

	    repository.save(board);
	}

}
