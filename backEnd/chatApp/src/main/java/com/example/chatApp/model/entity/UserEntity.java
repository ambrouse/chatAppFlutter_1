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
    @Column(name = "link_img_")
    String linkImg_;
    @Column(name = "age_")
    int age_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
}
