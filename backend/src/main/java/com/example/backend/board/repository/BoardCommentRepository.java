package com.example.backend.board.repository;

import com.example.backend.board.domain.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {
    @Query(value = "select * from board_comment where board_id = :id", nativeQuery=true)
    List<BoardComment> showBoardCommentPara(@Param("id") String id);

}

