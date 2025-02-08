package com.e.d.model.service;

import org.springframework.stereotype.Service;

import com.e.d.model.repository.LikeRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class LikeService {

	private final LikeRepository repository;
	
}
