package com.e.d.model.vo;

import java.time.LocalDateTime;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogCommentVo {
	private Long commentId;
    private Long blogId;
    private Long userId;
    private String commentContent;
    private LocalDateTime dateTime;
}
