package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOG_MEMBER")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id", nullable = false)
	private long memberId;
	
	@Column(name = "username", nullable = false, unique = true)
	private String username;
	
	@Column(name = "useremail", nullable = false)
	private String useremail;
	
	@Column(name = "userpassword", nullable = false)
	private String userpassword;
	
	@Column(name = "date_time", nullable = false)
	private String dateTime;
	
	@Column(name = "bio")
	private String bio;
	
	@Column(name = "profile_path", nullable = false)
	private String profile;
	
}
