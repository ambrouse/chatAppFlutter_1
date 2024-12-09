package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.ChatEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChatRepo extends JpaRepository<ChatEntity,String> {

    @Query(value = "select id_ as id_, content_ as content_ " +
            "from chat_ " +
            "where status_delete_ = 1 and id_link_user_ = :idLinkUser " +
            "ORDER  by day_send_ ASC",nativeQuery = true)
    List<Tuple> getChatByIdLinkUser(@Param("idLinkUser") String idLinkUser_);
}
