package com.e.d.model.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e.d.model.entity.BoardEntity;

@Repository
public interface BoardRepository extends JpaRepository<BoardEntity, Long> {
	Page<BoardEntity> findAll(Pageable pageable);
	List<BoardEntity> findByWriter(String writer);
	List<BoardEntity> searchByTitleIgnoreCaseContaining(String title);
}
