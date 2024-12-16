package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.UserEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepo extends JpaRepository<UserEntity,String> {

    @Query(value = "select u.name_, a.email_, a.password_, u.age_, u.link_img_ " +
            "from user_ u, authentication_ a " +
            "where u.id_ = :idUser_ and u.id_authentication_ = a.id_ and u.status_delete_=1 and a.status_delete_=1",nativeQuery = true)
    Tuple getUserById(@Param("idUser_") String idUser_);


    @Query(value = "select u.id_, a.id_ " +
            "from user_ u, authentication_ a " +
            "where u.id_ = :idUser_ and u.id_authentication_ = a.id_ and u.status_delete_=1 and a.status_delete_=1", nativeQuery = true)
    Tuple getUserByIdV2(@Param("idUser_") String idUser_);

    @Query(value = "select u.id_ " +
            "from user_ u, authentication_ a " +
            "where a.id_ = :idAu_ and u.id_authentication_ = a.id_ and u.status_delete_=1 and a.status_delete_=1", nativeQuery = true)
    Tuple getUserByIdAu(@Param("idAu_") String idAu_);


    @Query(value = "select u.id_ as id_, u.name_ as name_, u.link_img_ as linkImg_ " +
            "from user_ u " +
            "where u.name_ like %:name_% and u.status_delete_ = 1 and u.id_ != :idUser_ ",nativeQuery = true)
    List<Tuple> getUserByName(@Param("name_") String name_,
                              @Param("idUser_") String idUser_);
}
