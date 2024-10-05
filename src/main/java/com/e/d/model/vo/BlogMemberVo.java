package com.e.d.model.vo;

import java.time.LocalDateTime;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogMemberVo {
    private Long userId;
    private String username;
    private String useremail;
    private String userpassword;
    private String bio;
    private LocalDateTime dateTime;
    private Long followerId;
    private Long followedId;
}