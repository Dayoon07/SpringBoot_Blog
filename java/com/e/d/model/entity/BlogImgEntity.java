package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOGIMG")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BlogImgEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "img_id", nullable = false)
	private long imgId;
	
	@Column(name = "blog_value", nullable = false)
	private long blogValue;
	
	@Column(name = "filepath", nullable = false)
	private String filepath;
	
	@Column(name = "filename", nullable = false)
	private String filename;
	
	@Column(name = "create_at", nullable = false)
	private String createAt;
	
}
