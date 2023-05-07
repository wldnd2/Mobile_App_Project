package com.example.backend.domain;

import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@ToString
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

    @Column(length = 200, nullable = false)
    private String boardTitle;

    @Column(length = 200, nullable = false)
    private String boardImg;

    @Column(nullable = false)
    private String boardContent;

    @Column(nullable = false)
    private Integer boardLike;

    @Column(nullable = false)
    private Timestamp boardDate;

    // FK
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "board_user_id")
    private User user;

    // FK
    @Builder.Default
    @OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<BoardComment> boardComment = new ArrayList<>();
}