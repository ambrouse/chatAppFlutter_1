package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.HeartEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HeartRepo extends JpaRepository<HeartEntity,String> {
}
