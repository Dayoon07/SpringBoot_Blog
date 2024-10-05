package com.e.d.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.e.d.model.vo.BlogBoardVo;

@Mapper
public interface BlogBoardMapper {
	List<BlogBoardVo> selectAllBlogs();
	void insertBlog(String writer, String title, String blogcontent);
	BlogBoardVo selectBoardIdBlog(int boardId);
}
