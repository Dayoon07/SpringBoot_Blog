package com.e.d.model.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    private String profiletext;
    private LocalDateTime dateTime;
    private Long followerId;
    private Long followedId;
    
    public String getFormattedDateTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분");
        return dateTime.format(formatter);
    }
}