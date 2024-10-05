package com.e.d.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.e.d.model.vo.BlogMemberVo;

@Mapper
public interface BlogMemberMapper {
	void insertBlogMember(BlogMemberVo memberVo);
	 BlogMemberVo selectLoginUser(@Param("useremail") String useremail, @Param("userpassword") String userpassword);
}
