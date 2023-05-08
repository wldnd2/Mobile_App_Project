package com.example.backend.repository;

import com.example.backend.domain.DiaryComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiaryCommentRepository extends JpaRepository<DiaryComment, Long> {
}
