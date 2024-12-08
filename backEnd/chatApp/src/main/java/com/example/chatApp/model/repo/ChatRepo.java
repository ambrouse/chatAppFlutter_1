package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.ChatEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatRepo extends JpaRepository<ChatEntity,String> {
}
