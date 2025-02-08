package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOG_BOARD")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "blog_id", nullable = false)
	private long blogId;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "writer_id", nullable = false)
	private long writerId;
	
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
	
	@Column(name = "date_time", nullable = false)
	private String dateTime;
	
	@Column(name = "comment_count")
	private long commentCount;
	
	@Column(name = "img")
	private String img;
	
}
