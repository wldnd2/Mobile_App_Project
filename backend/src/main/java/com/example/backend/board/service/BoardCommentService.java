package com.example.backend.board.service;

import com.example.backend.board.domain.Board;
import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.repository.BoardCommentRepository;
import com.example.backend.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
public class BoardCommentService {
    @Autowired
    BoardCommentRepository boardCommentRepository;
    @Autowired
    BoardRepository boardRepository;

    public List<BoardComment> showComment(String id) {
        return boardCommentRepository.showBoardCommentPara(id);
    }

    public BoardComment createComment(Long id, BoardComment boardComment){
        Optional<Board> boardResult = boardRepository.findById(id);
        if(boardResult.isPresent()) {
            BoardComment comment = BoardComment.builder()
                    .commentWriter(boardComment.getCommentWriter())
                    .commentContent(boardComment.getCommentContent())
                    .commentDate(new Timestamp(System.currentTimeMillis()))
                    .board(boardResult.get())
                    .build();
            return boardCommentRepository.save(comment);
        }
        return null;
    }
}