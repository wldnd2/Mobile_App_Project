package com.example.backend.board.controller;

import com.example.backend.board.domain.Board;
import com.example.backend.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("list")
    public List<Board> showList() {
        return boardService.showAll();
    }

    @GetMapping("user")
    public List<Board> showUserDiary(@RequestParam(value = "writer") String writer) { return boardService.showUserDiary(writer); }

    @PostMapping("create")
    public Board createDiary(@RequestBody Board board) {
        return boardService.createDiary(board);
    }

    @PutMapping("/{id}")
    public Board updateDiary(@PathVariable Long id, @RequestBody Board board) { return boardService.updateBoard(id, board); }

    @DeleteMapping("/{id}")
    public void deleteBoard(@PathVariable Long id) { boardService.deleteBoard(id); }
}
