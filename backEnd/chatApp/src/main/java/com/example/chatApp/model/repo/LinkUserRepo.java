package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.LinkUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LinkUserRepo extends JpaRepository<LinkUserEntity,String> {
}
