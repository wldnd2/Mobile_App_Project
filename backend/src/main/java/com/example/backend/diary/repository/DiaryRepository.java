package com.example.backend.diary.repository;

import com.example.backend.board.domain.Board;
import com.example.backend.diary.domain.Diary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiaryRepository extends JpaRepository<Diary, Long> {
    @Query(value = "select * from diary where diary_writer = :writer", nativeQuery=true)
    List<Diary> showUserDiaryPara(@Param("writer") String writer);
}
