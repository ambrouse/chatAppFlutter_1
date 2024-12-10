package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.HeartEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface HeartRepo extends JpaRepository<HeartEntity,String> {
    @Query(value = "select COUNT(id_) " +
            "from heart_ " +
            "where id_blog_ = :idBlog_ and status_delete_=1 ",nativeQuery = true)
    int countHeartMyBlog(@Param("idBlog_") String idBlog);

    @Query(value = "select count(id_) " +
            "from heart_ " +
            "where id_blog_ = :idBlog_ and status_delete_=1",nativeQuery = true)
    int countHeartByFriendBlog(@Param("idBlog_") String idBlog_);

    @Query(value = "select l.id_ " +
            "from heart_ l " +
            "where id_blog_ = :idBlog_ and status_delete_=1 and id_user_ = :idUser_",nativeQuery = true)
    Tuple checkHeartByUser(@Param("idBlog_") String idBlog_,
                        @Param("idUser_") String idUser_);
}
