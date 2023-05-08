package com.example.backend.domain;

import lombok.*;
import net.minidev.json.JSONUtil;
import org.springframework.data.relational.core.mapping.Table;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TEST_DB")
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 200, nullable = false)
    private String userId;

    @Column(length = 200, nullable = false)
    private String userName;

    @Column(length = 200, nullable = false)
    private String password;

    @Column(length = 200, nullable = false)
    private String profile;

    // Community mapping
    @Builder.Default
    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Community> community = new ArrayList<>();

    // Board mapping
    @Builder.Default
    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Board> board = new ArrayList<>();

    // Board Comment mapping
    @Builder.Default
    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<BoardComment> boardComment = new ArrayList<>();

    // Diary mapping
    @Builder.Default
    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Diary> diary = new ArrayList<>();

    // Diary Comment mapping
    @Builder.Default
    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<DiaryComment> diaryComment = new ArrayList<>();
}
