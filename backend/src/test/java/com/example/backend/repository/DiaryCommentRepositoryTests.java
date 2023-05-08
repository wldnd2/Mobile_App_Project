package com.example.backend.repository;

import com.example.backend.domain.Diary;
import com.example.backend.domain.DiaryComment;
import com.example.backend.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Optional;
import java.util.stream.IntStream;

@SpringBootTest
@Transactional
public class DiaryCommentRepositoryTests {
    @Autowired
    DiaryCommentRepository diaryCommentRepository;
    @Autowired
    DiaryRepository diaryRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void InsertTest() {
        Long userId = 1L;
        Long diaryId = 1L;
        Optional<User> userResult= userRepository.findById(userId);
        Optional<Diary> diaryResult = diaryRepository.findById(diaryId);
        if(userResult.isPresent() && diaryResult.isPresent()) {
            IntStream.rangeClosed(1,10).forEach(i -> {
                DiaryComment diaryComment = DiaryComment.builder()
                        .commentContent("Comment_" + i)
                        .commentDate(new Timestamp(System.currentTimeMillis()))
                        .user(userResult.get())
                        .diary(diaryResult.get())
                        .build();
                diaryCommentRepository.save(diaryComment);
            });
        }
    }
}
