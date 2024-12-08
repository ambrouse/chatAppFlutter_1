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
@Table(name ="authentication_")
public class AuthenticationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_")
    String id_;
    @Column(name = "email_")
    String email_;
    @Column(name = "password_")
    String password_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
}
