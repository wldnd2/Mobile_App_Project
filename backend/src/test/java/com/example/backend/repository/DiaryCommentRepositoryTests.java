package com.example.backend.repository;


import com.example.backend.diary.domain.Diary;
import com.example.backend.diary.domain.DiaryComment;
import com.example.backend.diary.repository.DiaryCommentRepository;
import com.example.backend.diary.repository.DiaryRepository;
import com.example.backend.user.domain.User;
import com.example.backend.user.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Optional;
import java.util.stream.IntStream;

@SpringBootTest
public class DiaryCommentRepositoryTests {
    @Autowired
    DiaryCommentRepository diaryCommentRepository;
    @Autowired
    DiaryRepository diaryRepository;

    @Test
    public void InsertTest() {
        Long diaryId = 1L;
        Optional<Diary> diaryResult = diaryRepository.findById(diaryId);
        if(diaryResult.isPresent()) {
            IntStream.rangeClosed(1,10).forEach(i -> {
                DiaryComment diaryComment = DiaryComment.builder()
                        .commentWriter("commentWriter")
                        .commentContent("Comment_" + i)
                        .commentDate(new Timestamp(System.currentTimeMillis()))
                        .diary(diaryResult.get())
                        .build();
                diaryCommentRepository.save(diaryComment);
            });
        }
    }
}
