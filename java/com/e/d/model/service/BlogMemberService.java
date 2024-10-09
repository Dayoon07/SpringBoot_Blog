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
	public BlogMemberVo selectLoginMember(String username, String userpassword) {
		return mapper.selectLoginMember(username, userpassword);
	}
	
	@Override
	public BlogMemberVo selectAllMemberInfo(String username) {
		return mapper.selectAllMemberInfo(username);
	}

	@Override
	public int updateMemberInfo(BlogMemberVo blogMemberVo) {
        if (blogMemberVo.getUsername() != null && blogMemberVo.getUsername().isEmpty()) {
            blogMemberVo.setUsername(null);
        }
        if (blogMemberVo.getUserpassword() != null && blogMemberVo.getUserpassword().isEmpty()) {
            blogMemberVo.setUserpassword(null);
        }
        if (blogMemberVo.getProfiletext() != null && blogMemberVo.getProfiletext().isEmpty()) {
            blogMemberVo.setProfiletext(null);
        }
        return mapper.updateMemberInfo(blogMemberVo);
    }
	
	@Override
	public void deleteBlogmember(int userId) {
		mapper.deleteBlogmember(userId);
	}
	
}
