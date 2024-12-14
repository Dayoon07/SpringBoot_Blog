package com.e.d.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.CommentRepository;

import jakarta.transaction.Transactional;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Transactional
	public boolean toggleLike(long blogid, long memberid) {
	    BoardEntity blog = boardRepository.findById(blogid)
	            .orElseThrow(() -> new IllegalArgumentException("블로그 게시글을 찾을 수 없습니다."));

	    if (blog.getLikesByUser().contains(memberid)) {
	        // 좋아요 취소
	        blog.getLikesByUser().remove(memberid);
	        blog.setLikes(blog.getLikes() - 1);
	        boardRepository.save(blog);
	        return false; // 좋아요 취소됨
	    } else {
	        // 좋아요 추가
	        blog.getLikesByUser().add(memberid);
	        blog.setLikes(blog.getLikes() + 1);
	        boardRepository.save(blog);
	        return true; // 좋아요 추가됨
	    }
	}
	
	public Page<BoardEntity> getBoardWithCommentCount(Pageable pageable) {
        Page<BoardEntity> boardPage = boardRepository.findAll(pageable);
        
        // 각 게시물에 대해 댓글 수를 설정
        boardPage.forEach(board -> {
            long commentCount = commentRepository.countByCommentasblogid(board.getBlogid());
            board.setCommentCount(commentCount);
            boardRepository.save(board);
        });

        return boardPage;
    }

}
