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

    @GetMapping("/sortList")
    public List<Diary> sortList() {return diaryService.showSortList();}

    @GetMapping("user")
    public List<Diary> showUserDiary(@RequestParam(value = "writer") String writer) { return diaryService.showUserDiary(writer); }

    @PostMapping("create")
    public Diary createDiary(@RequestBody Diary diary) {
        return diaryService.createDiary(diary);
    }

    @PutMapping("/{id}")
    public Diary updateDiary(@PathVariable Long id, @RequestBody Diary diary) { return diaryService.updateDiary(id, diary); }

    @DeleteMapping("/{id}")
    public void deleteDiary(@PathVariable Long id) { diaryService.deleteDiary(id); }

    @PutMapping("/increase/{id}")
    public Diary increment(@PathVariable Long id) {
        return diaryService.increment(id);
    }

    @PutMapping("/decrease/{id}")
    public Diary decrement(@PathVariable Long id) { return diaryService.decrement(id); }
}
