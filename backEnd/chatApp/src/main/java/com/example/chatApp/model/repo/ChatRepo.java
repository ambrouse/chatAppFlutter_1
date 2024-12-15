package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.ChatEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChatRepo extends JpaRepository<ChatEntity,String> {

    @Query(value = "select id_ as id_, content_ as content_, id_user_send_ as idUserSend_ " +
            "from chat_ c " +
            "where  (c.id_user_send_ = :idUser_ or c.id_user_send_ = :idFriend_) and (c.id_user_receive_ = :idUser_ or c.id_user_receive_ = :idFriend_) " +
            "ORDER  by c.day_send_ asc",nativeQuery = true)
    List<Tuple> getChatByUserAndFriend(@Param("idUser_") String idUser_,
                                       @Param("idFriend_") String idFriend_);
}
