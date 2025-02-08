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

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardService {

	private final BoardRepository repository;

	public BoardEntity boardWrite1(String title, long writerId, String writer, 
			String content, String category, String dateTime) {
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.build();
		
		return repository.save(entity);
	}
	
	public BoardEntity boardWrite2(String title, long writerId, String writer, 
			String content, String category, String dateTime, HttpSession session,
			MultipartFile img) throws IllegalStateException, IOException {
		String uploadDir = session.getServletContext().getRealPath("/resources/blog-img/");
		String extension = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("-", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists()) dir.mkdirs();
		
		img.transferTo(new File(uploadDir + fileName));
		
		BoardEntity entity = BoardEntity.builder()
				.title(title)
				.writerId(writerId)
				.writer(writer)
				.content(content)
				.category(category)
				.dateTime(dateTime)
				.img("/resources/blog-img/" + fileName)
				.build();
		
		return repository.save(entity);
	}
	
}
