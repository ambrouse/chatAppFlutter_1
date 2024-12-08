package com.example.chatApp.model.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(name ="blog_")
public class BlogEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_")
    String id_;
    @Column(name = "id_user_")
    String idUser_;
    @Column(name = "title_")
    String title_;
    @Column(name = "content_")
    String content_;
    @Column(name = "status_")
    String status_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
    @Column(name = "day_blog_")
    LocalDateTime dayBlog_;
}
