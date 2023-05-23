package com.example.backend.community.repository;

import com.example.backend.community.domain.Community;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommunityRepository extends JpaRepository<Community, Long> {
    @Query(value = "SELECT * FROM community where community_writer = :writer", nativeQuery = true)
    List<Community> showUserCommunityPara(@Param("writer") String writer);
}
