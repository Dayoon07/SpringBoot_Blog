package com.e.d.model.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "BLOGCOMMENT")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "commentid", nullable = false)
	private Long commentid;
	
	@Column(name = "blogboard_title", nullable = false)
	private String blogboard_title;
	
	@Column(name = "commenter", nullable = false)
	private String commenter;
	
	@Lob
	@Column(name = "commentcontent", nullable = false)
	private String commentcontent;
	
	@Column(name = "commentdatetime", nullable = false, columnDefinition = "DEFAULT CURRENT_TIMESTAMP")
	private String commentdatetime;
	
	@Column(name = "parentcommentid")
	private long parentcommentid;
}
