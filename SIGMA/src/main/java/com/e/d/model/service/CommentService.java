package com.e.d.model.service;

import org.springframework.stereotype.Service;

import com.e.d.model.entity.CommentEntity;
import com.e.d.model.repository.CommentRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentService {

	private final CommentRepository repository;

	public void addComment(long commenterId, String commenterName, String commenterProfile, 
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
	}
	
	@Transactional
	public void dropAccount(long memberId) {
		repository.deleteByCommenterId(memberId);
	}
	
	@Transactional
	public void deleteComment(long commentId) {
		repository.deleteById(commentId);
	}

}
