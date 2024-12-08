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
@Table(name ="user_")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_")
    String id_;
    @Column(name = "id_authentication_")
    String idAuthentication_;
    @Column(name = "name_")
    String name_;
    @Column(name = "age_")
    String age_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
}
