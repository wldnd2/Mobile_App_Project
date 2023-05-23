package com.example.backend.diary.controller;

import com.example.backend.board.domain.BoardComment;
import com.example.backend.board.service.BoardCommentService;
import com.example.backend.diary.domain.DiaryComment;
import com.example.backend.diary.service.DiaryCommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/diary_comment")
public class DiaryCommentController {
    @Autowired
    DiaryCommentService diaryCommentService;

    @GetMapping("/list")
    public List<DiaryComment> showComment(@RequestParam(value = "id") String id) { return diaryCommentService.showComment(id); }

    @PostMapping("create")
    public DiaryComment createComment(@RequestParam(value = "id") Long id, @RequestBody DiaryComment diaryComment) {
        return diaryCommentService.createComment(id, diaryComment);
    }
}
