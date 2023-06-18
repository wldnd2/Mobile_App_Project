package com.example.backend.board.repository;


import com.example.backend.board.domain.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {
    @Query(value = "select * from board where board_writer = :writer", nativeQuery=true)
    List<Board> showUserBoardPara(@Param("writer") String writer);

    @Query(value = "SELECT * FROM board ORDER BY board_like ASC", nativeQuery = true)
    List<Board> findAllOrderByBoardLike();
}
