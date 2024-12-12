package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.FriendRequestEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FriendrequestRepo extends JpaRepository<FriendRequestEntity,String> {


    @Query(value = "select f.id_ as id_, u.name_ as name_, u.link_img_ as linkImg_ " +
            "from friend_request_ f, user_ u " +
            "where id_user_friend_ = :idUser_ and u.id_ = f.id_user_ and f.status_delete_ = 1 and u.status_delete_ = 1",nativeQuery = true)
    List<Tuple> getRequestUserByIdUser(@Param("idUser_") String idUser_);
}
