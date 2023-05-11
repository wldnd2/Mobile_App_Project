package com.example.backend.repository;

import com.example.backend.board.domain.Board;
import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.repository.BoardCommentRepository;
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
public class BoardCommentRepositoryTests {
    @Autowired
    BoardCommentRepository boardCommentRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    BoardRepository boardRepository;
    @Test
    public void InsertTest() {
        Long userId = 1L;
        Optional<User> userResult = userRepository.findById(userId);
        Long boardId = 1L;
        Optional<Board> boardResult = boardRepository.findById(boardId);
        if(userResult.isPresent() && boardResult.isPresent()) {
            IntStream.rangeClosed(1, 10).forEach(i -> {
                BoardComment boardComment = BoardComment.builder()
                        .commentContent("comment ... " + i)
                        .commentDate(new Timestamp(System.currentTimeMillis()))
                        .user(userResult.get())
                        .board(boardResult.get())
                        .build();
                boardCommentRepository.save(boardComment);
            });
        }
    }
}
