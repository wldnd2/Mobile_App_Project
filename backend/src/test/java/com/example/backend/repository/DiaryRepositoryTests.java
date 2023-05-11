package com.example.backend.repository;

import com.example.backend.diary.domain.Diary;
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
public class DiaryRepositoryTests {
    @Autowired
    DiaryRepository diaryRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void InsertTest() {
        Long userId = 1L;
        Optional<User> result = userRepository.findById(userId);
        if (result.isPresent()) {
            IntStream.rangeClosed(1,10).forEach(i ->{
                Diary diary = Diary.builder()
                        .diaryTitle("Title_" + i)
                        .diaryImg("Img_" + i)
                        .diaryContent("Content_" + i)
                        .diaryLike(i)
                        .diaryDate(new Timestamp(System.currentTimeMillis()))
                        .user(result.get())
                        .build();
                diaryRepository.save(diary);
            });
        }
    }
}

