package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.FriendRequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FriendrequestRepo extends JpaRepository<FriendRequestEntity,String> {
}
