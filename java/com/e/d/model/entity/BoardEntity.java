package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOGBOARD")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blog_id")
	private long blogid;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "writer", nullable = false)
	private String writer;
	
	@Column(name = "content", nullable = false)
	private String content;
	
	@Column(name = "views")
	private long views;
	
	@Column(name = "likes")
	private long likes;
	
	@Column(name = "category", nullable = false)
	private String category;
	
	@Column(name = "datetime", nullable = false)
	private String datetime;
}
