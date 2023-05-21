package com.example.backend.diary.repository;

import com.example.backend.diary.domain.DiaryComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiaryCommentRepository extends JpaRepository<DiaryComment, Long> {
}