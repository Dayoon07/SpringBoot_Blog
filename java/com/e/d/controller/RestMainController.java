package com.e.d.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.e.d.model.entity.BoardEntity;
import com.e.d.model.repository.BoardRepository;

@RestController
public class RestMainController {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@GetMapping("/pat")
	public List<BoardEntity> allPost() {
		return boardRepository.findAll();
	}
	
	
}
