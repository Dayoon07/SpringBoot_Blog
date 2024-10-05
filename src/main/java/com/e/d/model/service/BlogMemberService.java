package com.e.d.model.service;

import org.springframework.stereotype.Service;

import com.e.d.model.mapper.BlogMemberMapper;
import com.e.d.model.vo.BlogMemberVo;

@Service
public class BlogMemberService implements BlogMemberMapper {
	
	private BlogMemberMapper mapper;
	
	public BlogMemberService(BlogMemberMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void insertBlogMember(BlogMemberVo memberVo) {
		mapper.insertBlogMember(memberVo);
	}
	
	@Override
	public BlogMemberVo selectLoginUser(String useremail, String userpassword) {
		return mapper.selectLoginUser(useremail, userpassword);
	}
	
}
