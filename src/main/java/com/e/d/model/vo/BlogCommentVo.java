package com.e.d.model.vo;

import java.time.LocalDateTime;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogCommentVo {
	private int commentId;
    private int blogId;
    private int userId;
    private String commentContent;
    private LocalDateTime dateTime;
}
