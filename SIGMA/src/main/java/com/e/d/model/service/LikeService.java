package com.e.d.model.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.LikeEntity;
import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.LikeRepository;
import com.e.d.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class LikeService {

	private final BoardRepository boardRepository;
	private final LikeRepository repository;
	private final MemberRepository memberRepository;
	
	public void addLike(long blogId, long likerId) {
		boardRepository.findById(blogId).ifPresent(blog -> {
			LikeEntity entity = LikeEntity.builder()
					.blogId(blogId)
					.likerId(likerId)
					.build();
			repository.save(entity);
			
			BoardEntity board = boardRepository.findById(blogId).get();
			board.setLikes(repository.countByBlogId(blogId));
			boardRepository.save(board);
			
		});
	}
	
	public void updateLikeCount(Long blogId) {
	    if (blogId == null) {
	        log.warn("blogId가 null입니다.");
	        return;
	    }

	    boardRepository.findById(blogId).ifPresent(board -> {
	        // 효율적인 카운트 쿼리
	        int likeCount = repository.countByBlogId(blogId);
	        board.setLikes(likeCount);
	        boardRepository.save(board);
	        log.info("게시글 ID: {}의 좋아요 수가 {}로 업데이트되었습니다.", blogId, likeCount);
	    });
	}
	
	public List<BoardEntity> myLikeBoardList(String username) {
		MemberEntity member = memberRepository.findByUsername(username);
		
		// 사용자가 좋아요한 목록 조회
	    List<LikeEntity> likeList = repository.findByLikerId(member.getMemberId());
	    
	    // 좋아요한 게시글들의 ID를 추출
	    List<Long> blogIds = likeList.stream()
	        .map(LikeEntity::getBlogId)
	        .collect(Collectors.toList());
	    
	    // 해당 ID들의 게시글 정보를 조회
	    List<BoardEntity> likedBoards = boardRepository.findAllById(blogIds);
	    
	    return likedBoards;
	}
	
}
