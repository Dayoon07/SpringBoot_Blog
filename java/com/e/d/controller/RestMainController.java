package com.e.d.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.MemberRepository;


@RestController
public class RestMainController {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@GetMapping("/path")
	public List<MemberEntity> getMethodName(MemberEntity entity) {
		return memberRepository.findAll();
	}
	
	
}
