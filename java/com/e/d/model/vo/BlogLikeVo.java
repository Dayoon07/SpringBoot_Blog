package com.e.d.model.vo;

import java.time.LocalDateTime;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogLikeVo {
	private Long likeId;
    private Long blogId;
    private Long userId;
    private LocalDateTime dateTime;
}
