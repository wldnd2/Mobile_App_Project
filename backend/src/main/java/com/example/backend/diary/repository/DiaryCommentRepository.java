package com.example.backend.diary.repository;

import com.example.backend.board.domain.BoardComment;
import com.example.backend.diary.domain.DiaryComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiaryCommentRepository extends JpaRepository<DiaryComment, Long> {
    @Query(value = "select * from diary_comment where diary_id = :id", nativeQuery=true)
    List<DiaryComment> showDiaryCommentPara(@Param("id") String id);
}