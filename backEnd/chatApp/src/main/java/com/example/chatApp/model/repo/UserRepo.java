package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.UserEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepo extends JpaRepository<UserEntity,String> {

    @Query(value = "select u.name_, a.email_, a.password_, u.age_ " +
            "from user_ u, authentication_ a " +
            "where u.id_ = :idUser_ and u.id_authentication_ = a.id_",nativeQuery = true)
    Tuple getUserById(@Param("idUser_") String idUser_);


    @Query(value = "select u.id_, a.id_ " +
            "from user_ u, authentication_ a " +
            "where u.id_ = :idUser_ and u.id_authentication_ = a.id_",nativeQuery = true)
    Tuple getUserByIdV2(@Param("idUser_") String idUser_);
}
