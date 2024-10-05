package com.e.d.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.e.d.model.vo.NoticeVo;

@Mapper
public interface NoticeMapper {
	List<NoticeVo> selectAllNotice();
	NoticeVo selectViewNotice(int noticeid);
}
