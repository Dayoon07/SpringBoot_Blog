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
	
	@Override
	public List<BlogBoardVo> selectByBlogWriter(String writer) {
		return mapper.selectByBlogWriter(writer);
	}
	
	@Override
	public void updateOnlyMyBlog(BlogBoardVo blogBoardVo) {
	    if (blogBoardVo.getTitle() != null && blogBoardVo.getTitle().isEmpty()) {
	        blogBoardVo.setTitle(null);
	    }
	    if (blogBoardVo.getBlogContent() != null && blogBoardVo.getBlogContent().isEmpty()) {
	        blogBoardVo.setBlogContent(null);
	    }
	    mapper.updateOnlyMyBlog(blogBoardVo);
	}
	
}
