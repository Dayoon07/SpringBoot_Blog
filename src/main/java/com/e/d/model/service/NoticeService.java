package com.e.d.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.e.d.model.mapper.NoticeMapper;
import com.e.d.model.vo.NoticeVo;

@Service
public class NoticeService implements NoticeMapper {
	
	private NoticeMapper mapper;
	
	public NoticeService(NoticeMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<NoticeVo> selectAllNotice() {
		return mapper.selectAllNotice();
	}
	
	@Override
	public NoticeVo selectViewNotice(int noticeid) {
		return mapper.selectViewNotice(noticeid);
	}
	
}
