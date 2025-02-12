package com.e.d.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e.d.model.entity.LikeEntity;
import java.util.Optional;
import java.util.List;

@Repository
public interface LikeRepository extends JpaRepository<LikeEntity, Long> {
	Optional<LikeEntity> findByLikerIdAndBlogId(long likerId, long blogId);

	List<LikeEntity> findByBlogId(long blogId);
	
	int countByBlogId(long blogId);
	
	List<LikeEntity> findByLikerId(long likerId);
}
