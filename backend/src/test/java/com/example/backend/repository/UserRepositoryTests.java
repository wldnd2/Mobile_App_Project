package com.example.backend.repository;

import com.example.backend.domain.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.stream.IntStream;

@SpringBootTest
@Transactional
public class UserRepositoryTests {
    @Autowired
    UserRepository userRepository;
    @Test
    public void InsertTest() {
        IntStream.rangeClosed(1,5).forEach(i -> {
            User user = User.builder()
                    .userId("Google_" + i)
                    .userName("test_" + i)
                    .password("password_" + i)
                    .profile("Hello! Cat Diary")
                    .build();
            userRepository.save(user);
        });
    }
}
