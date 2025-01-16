package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOGMEMBER")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "memberid", nullable = false)
	private long memberid;
	
	@Column(name = "username", nullable = false)
	private String username;
	
	@Column(name = "useremail", nullable = false, unique = true)
	private String useremail;
	
	@Column(name = "userpassword", nullable = false)
	private String userpassword;
	
	@Column(name = "joindate", nullable = false)
	private String joindate;
	
	@Lob
	@Column(name = "profilebio")
	private String profilebio;
}
