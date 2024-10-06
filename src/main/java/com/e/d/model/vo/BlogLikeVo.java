package com.e.d.model.vo;

import java.time.LocalDateTime;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogLikeVo {
	private int likeId;
    private int blogId;
    private int userId;
    private LocalDateTime dateTime;
}
