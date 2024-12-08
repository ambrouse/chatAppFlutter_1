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
@Table(name ="chat_")
public class ChatEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_")
    String id_;
    @Column(name = "id_link_user_")
    String idLinkUser_;
    @Column(name = "content_")
    String content_;
    @Column(name = "status_delete_")
    Integer statusDelete_;
    @Column(name = "day_delete_")
    LocalDateTime dayDelete_;
    @Column(name = "day_send_")
    LocalDateTime daySend_;
}
