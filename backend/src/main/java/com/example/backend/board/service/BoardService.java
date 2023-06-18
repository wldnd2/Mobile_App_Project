package com.example.backend.board.service;

import com.example.backend.board.domain.Board;
import com.example.backend.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.sql.Timestamp;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    public List<Board> showAll() {
        return boardRepository.findAll();
    }

    public List<Board> showSortList() { return boardRepository.findAllOrderByBoardLike();}

    public List<Board> showUserDiary(String writer) {
        return boardRepository.showUserBoardPara(writer);
    }

    public Board createDiary(Board board) {
        Board newBoard = Board.builder()
                .boardWriter(board.getBoardWriter())
                .boardTitle(board.getBoardTitle())
                .boardContent(board.getBoardContent())
                .boardImg(board.getBoardImg())
                .boardDate(new Timestamp(System.currentTimeMillis()))
                .boardLike(0)
                .build();
        return boardRepository.save(newBoard);
    }

    public Board updateBoard(Long id, Board board) {
        Board existingBoard = boardRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingBoard.setBoardWriter(board.getBoardWriter());
        existingBoard.setBoardTitle(board.getBoardTitle());
        existingBoard.setBoardContent(board.getBoardContent());
        existingBoard.setBoardImg(board.getBoardImg());
        existingBoard.setBoardLike(existingBoard.getBoardLike());
        existingBoard.setBoardDate(existingBoard.getBoardDate());
        return boardRepository.save(existingBoard);
    }

    public void deleteBoard(Long id) {
        boardRepository.deleteById(id);
    }

    public Board increment(Long id) {
        Board existingBoard = boardRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingBoard.increaseLike();
        return boardRepository.save(existingBoard);
    }

    public Board decrement(Long id) {
        Board existingBoard = boardRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existingBoard.decreaseLike();
        return boardRepository.save(existingBoard);
    }
}
