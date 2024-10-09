package com.e.d.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.e.d.model.vo.BlogMemberVo;

@Mapper
public interface BlogMemberMapper {
	void insertBlogMember(BlogMemberVo memberVo);
	void deleteBlogmember(int userId);
	
	BlogMemberVo selectLoginMember(@Param("username") String username, @Param("userpassword") String userpassword);
	BlogMemberVo selectAllMemberInfo(String username);
	
	int updateMemberInfo(BlogMemberVo memberVo);
}
