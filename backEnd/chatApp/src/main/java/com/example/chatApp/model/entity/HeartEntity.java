package com.example.chatApp.model.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(name ="heart_")
public class HeartEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_")
    String id_;
    @Column(name = "id_user_")
    String idUser_;
    @Column(name = "id_blog_")
    String idBlog_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
}
