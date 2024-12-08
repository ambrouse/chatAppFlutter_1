package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.AuthenticationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepo extends JpaRepository<AuthenticationEntity,String> {
}
