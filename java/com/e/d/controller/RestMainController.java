package com.e.d.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.BoardRepository;
import com.e.d.model.repository.MemberRepository;

@RestController
public class RestMainController {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@GetMapping("/path")
	public List<MemberEntity> getMethodName(MemberEntity entity) {
		return memberRepository.findAll();
	}
	
	@GetMapping("/pat")
	public ResponseEntity<List<BoardEntity>> allPost() {
		return ResponseEntity.ok(boardRepository.findAll());
	}
	
	
}
