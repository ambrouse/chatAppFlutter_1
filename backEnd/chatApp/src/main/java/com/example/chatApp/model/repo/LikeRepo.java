package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.LikeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LikeRepo extends JpaRepository<LikeEntity,String> {
}
