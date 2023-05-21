package com.example.backend.repository;

import com.example.backend.board.domain.Board;
import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.repository.BoardCommentRepository;
import com.example.backend.board.repository.BoardRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Timestamp;
import java.util.Optional;
import java.util.stream.IntStream;

@SpringBootTest
public class BoardCommentRepositoryTests {
    @Autowired
    BoardCommentRepository boardCommentRepository;
    @Autowired
    BoardRepository boardRepository;
    @Test
    public void InsertTest() {
        Long boardId = 4L;
        Optional<Board> boardResult = boardRepository.findById(boardId);
        if(boardResult.isPresent()) {
            IntStream.rangeClosed(1, 10).forEach(i -> {
                BoardComment boardComment = BoardComment.builder()
                        .commentWriter("commentWriter")
                        .commentContent("comment ... " + i)
                        .commentDate(new Timestamp(System.currentTimeMillis()))
                        .board(boardResult.get())
                        .build();
                boardCommentRepository.save(boardComment);
            });
        }
    }
}
