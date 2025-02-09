package com.e.d.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.CommentEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.CommentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentService {

	private final BoardRepository boardRepository;
	private final CommentRepository repository;

	@Transactional
	public int addComment(long commenterId, String commenterName, String commenterProfile, 
			String commentContent, long blogWriterId, long blogId, String dateTime) {
		CommentEntity entity = CommentEntity.builder()
				.commenterId(commenterId)
				.commenterName(commenterName)
				.commenterProfile(commenterProfile)
				.commentContent(commentContent)
				.blogWriterId(blogWriterId)
				.blogId(blogId)
				.dateTime(dateTime)
				.build();
		repository.save(entity);
		return repository.findByBlogId(blogId).size();
	}

}
