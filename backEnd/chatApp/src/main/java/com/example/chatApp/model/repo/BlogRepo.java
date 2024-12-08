package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.BlogEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogRepo extends JpaRepository<BlogEntity,String> {
}
