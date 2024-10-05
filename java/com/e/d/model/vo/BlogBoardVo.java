package com.e.d.model.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogBoardVo {
	private Long blogid;
	private String writer;
    private String title;
    private String blogContent;
    private Long blogviews;
    private LocalDateTime dateTime;
    
    public String getFormattedDateTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분");
        return dateTime.format(formatter);
    }
}