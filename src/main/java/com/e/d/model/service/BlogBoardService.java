package com.e.d.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.e.d.model.mapper.BlogBoardMapper;
import com.e.d.model.vo.BlogBoardVo;

@Service
public class BlogBoardService implements BlogBoardMapper {

	private BlogBoardMapper mapper;
	
	public BlogBoardService(BlogBoardMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<BlogBoardVo> selectAllBlogs() {
		return mapper.selectAllBlogs();
	}
	
	@Override
	public void insertBlog(String writer, String title, String blogcontent) {
		mapper.insertBlog(writer, title, blogcontent);
	}
	
	@Override
	public BlogBoardVo selectBoardIdBlog(int boardId) {
		return mapper.selectBoardIdBlog(boardId);
	}
	
}
