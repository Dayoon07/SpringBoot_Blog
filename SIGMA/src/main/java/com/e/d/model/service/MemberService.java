package com.e.d.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.e.d.model.entity.MemberEntity;
import com.e.d.model.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberService {

	private final MemberRepository memberRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public MemberEntity signup(String username, String useremail, String dateTime, String userpassword, String bio,
			MultipartFile profile, HttpSession session) throws IllegalStateException, IOException {
		
		String uploadDir = session.getServletContext().getRealPath("/resources/profile-img/");
		String extension = profile.getOriginalFilename().substring(profile.getOriginalFilename().lastIndexOf("."));
		String fileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss")) + "_"
				+ UUID.randomUUID().toString().replaceAll("[^a-zA-Z0-9]", "") + extension;

		File dir = new File(uploadDir);
		if (!dir.exists()) dir.mkdirs();
		
		profile.transferTo(new File(uploadDir + fileName));

		MemberEntity entity = MemberEntity.builder().username(username).useremail(useremail)
				.userpassword(passwordEncoder.encode(userpassword)).dateTime(dateTime).bio(bio)
				.profile("/resources/profile-img/" + fileName) // 경로 수정 (절대 경로 대신 상대 경로 추천)
				.build();

		return memberRepository.save(entity);
	}
	
	@Transactional
	public void dropAccount(long memberId) {
		memberRepository.deleteById(memberId);
	}

}
