package com.example.backend.board.controller;

import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.service.BoardCommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board_comment")
public class BoardCommentController {
    @Autowired
    BoardCommentService boardCommentService;

    @GetMapping("/list")
    public List<BoardComment> showComment(@RequestParam(value = "id") String id) { return boardCommentService.showComment(id); }

    @PostMapping("create")
    public BoardComment createComment(@RequestParam(value = "id") Long id, @RequestBody BoardComment boardComment) {
        return boardCommentService.createComment(id, boardComment);
    }
}