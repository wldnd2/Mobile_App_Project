package com.example.backend.repository;

import com.example.backend.board.domain.Board;
import com.example.backend.board.repository.BoardRepository;
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
@Transactional
public class BoardRepositoryTests {
    @Autowired
    BoardRepository boardRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void InsertTest() {
        Long userId = 1L;
        Optional<User> result = userRepository.findById(userId);
        if(result.isPresent()) {
            IntStream.rangeClosed(1, 10).forEach(i -> {
                Board board = Board.builder()
                        .boardTitle("Board_" + i)
                        .boardImg("Cat_img_" + i)
                        .boardContent("Board_content_" + i)
                        .boardLike(i)
                        .boardDate(new Timestamp(System.currentTimeMillis()))
                        .user(result.get())
                        .build();
                boardRepository.save(board);
            });
        }
    }
}
