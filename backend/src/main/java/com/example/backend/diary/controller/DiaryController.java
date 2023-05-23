package com.example.backend.diary.controller;

import com.example.backend.board.domain.Board;
import com.example.backend.diary.domain.Diary;
import com.example.backend.diary.service.DiaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/diary")
public class DiaryController {
    @Autowired
    DiaryService diaryService;

    @GetMapping("list")
    public List<Diary> showList() {
        return diaryService.showAll();
    }

    @GetMapping("user")
    public List<Diary> showUserDiary(@RequestParam(value = "writer") String writer) { return diaryService.showUserDiary(writer); }

    @PostMapping("create")
    public Diary createDiary(@RequestBody Diary diary) {
        return diaryService.createDiary(diary);
    }

}
