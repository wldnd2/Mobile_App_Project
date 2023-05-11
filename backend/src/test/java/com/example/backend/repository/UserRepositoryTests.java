package com.example.backend.repository;

import com.example.backend.user.domain.User;
import com.example.backend.user.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.stream.IntStream;

@SpringBootTest
public class UserRepositoryTests {
    @Autowired
    UserRepository userRepository;
    @Test
    public void InsertTest() {
        IntStream.rangeClosed(1,5).forEach(i -> {
            User user = User.builder()
                    .userName("Google_" + i)
                    .userEmail(String.format("example%d@example.com", i))
                    .password("password_" + i)
                    .profile("Hello! Cat Diary")
                    .build();
            userRepository.save(user);
        });
    }
}
