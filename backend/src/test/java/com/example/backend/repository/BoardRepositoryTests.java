package com.example.backend.repository;

import com.example.backend.board.domain.Board;
import com.example.backend.board.repository.BoardRepository;
import com.example.backend.user.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Timestamp;
import java.util.stream.IntStream;

@SpringBootTest
public class BoardRepositoryTests {
    @Autowired
    BoardRepository boardRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void InsertTest() {
        IntStream.rangeClosed(1, 3).forEach(i -> {
            Board board = Board.builder()
                    .boardWriter("Google_"+i)
                    .boardTitle("Board_" + i)
                    .boardImg("Cat_img_" + i)
                    .boardContent("Board_content_" + i)
                    .boardLike(i)
                    .boardDate(new Timestamp(System.currentTimeMillis()))
                    .build();
            boardRepository.save(board);
        });
    }
}
