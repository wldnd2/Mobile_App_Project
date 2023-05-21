package com.example.backend.board.service;

import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.repository.BoardCommentRepository;
import com.example.backend.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardCommentService {
    @Autowired
    BoardCommentRepository boardCommentRepository;
    @Autowired
    BoardRepository boardRepository;

    public List<BoardComment> showComment(String id) {
        return boardCommentRepository.showBoardCommentPara(id);
    }
}