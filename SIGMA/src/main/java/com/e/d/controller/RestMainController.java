package com.e.d.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class RestMainController {

	private final BoardRepository boardRepository;
	private final MemberRepository memberRepository;
	
	@GetMapping("/check-username")
    public boolean checkUsername(@RequestParam String username) {
        MemberEntity existingMember = memberRepository.findByUsername(username);
        return existingMember == null;
    }
	
	@PostMapping("/boardCommentCountSave")
	public ResponseEntity<Long> boardCommentCountSave(@RequestParam long commentCount, @RequestParam long blogId) {
		boardRepository.findById(blogId).get();
		BoardEntity board = boardRepository.findById(blogId).get();
		board.setCommentCount(commentCount);
		boardRepository.save(board);
		return ResponseEntity.ok(commentCount);
	}
	
}
