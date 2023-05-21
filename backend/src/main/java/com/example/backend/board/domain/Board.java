package com.example.backend.board.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TEST_DB")
@Entity
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardId;

    @Column(nullable = false)
    private String boardWriter;

    @Column(length = 200, nullable = false)
    private String boardTitle;

    @Column(length = 200, nullable = false)
    private String boardImg;

    @Column(nullable = false)
    private String boardContent;

    @Column(nullable = false)
    private Integer boardLike;

    @Column()
    private Timestamp boardDate;

    public void setBoardWriter(String boardWriter) {
        this.boardWriter = boardWriter;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public void setBoardImg(String boardImg) {
        this.boardImg = boardImg;
    }

    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }

    public void setBoardLike(Integer boardLike) {
        this.boardLike = boardLike;
    }

    public void setBoardDate(Timestamp boardDate) {
        this.boardDate = boardDate;
    }

    public void increaseLike() { this.boardLike++; }

    public void decreaseLike() {
        this.boardLike--;
    }

    @Builder.Default
    @OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE, orphanRemoval = true)
    @JsonManagedReference
    private List<BoardComment> boardComments = new ArrayList<>();
}