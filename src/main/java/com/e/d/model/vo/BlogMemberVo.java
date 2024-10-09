package com.e.d.model.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogMemberVo {
    private int userId;
    private String username;
    private String useremail;
    private String userpassword;
    private String profiletext;
}