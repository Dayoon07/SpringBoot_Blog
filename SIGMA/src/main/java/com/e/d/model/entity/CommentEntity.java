package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOG_COMMENT")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id", nullable = false)
	private long commentId;
	
	@Column(name = "commenter_id", nullable = false)
	private long commenterId;
	
	@Column(name = "commenter_name", nullable = false)
	private String commenterName;
	
	@Column(name = "commenter_profile", nullable = false)
	private String commenterProfile;
	
	@Column(name = "comment_content", nullable = false)
	private String commentContent;
	
	@Column(name = "blog_writer_id", nullable = false)
	private long blogWriterId;
	
	@Column(name = "blog_id", nullable = false)
	private long blogId;
	
	@Column(name = "date_time", nullable = false)
	private String dateTime;
	
	@Column(name = "likes")
	private long likes;
	
	@Column(name = "unlikes")
	private long unlikes;
	
}
