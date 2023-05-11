package com.example.backend.domain;

import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import javax.persistence.*;

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
    private String userName;

    @Column(length = 200, nullable = false)
    private String userEmail;

    @Column(length = 200, nullable = false)
    private String password;

    @Column(length = 200, nullable = false)
    private String profile;
}
