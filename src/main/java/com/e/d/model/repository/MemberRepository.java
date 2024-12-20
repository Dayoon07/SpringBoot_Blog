package com.e.d.model.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.e.d.model.entity.MemberEntity;

@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
	Optional<MemberEntity> findByUsernameAndUserpassword(String username, String userpassword);
	Optional<MemberEntity> findByUsername(String username);
}
