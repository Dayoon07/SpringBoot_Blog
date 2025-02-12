package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOG_LIKE")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LikeEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "like_id", nullable = false)
	private long likeId;
	
	@Column(name = "blog_id", nullable = false)
	private long blogId;
	
	@Column(name = "liker_id", nullable = false)
	private long likerId;
	
}
