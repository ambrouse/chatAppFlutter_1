package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.LikeEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LikeRepo extends JpaRepository<LikeEntity,String> {
    @Query(value = "select COUNT(id_) " +
            "from like_ " +
            "where id_blog_ = :idBlog_ and status_delete_=1",nativeQuery = true)
    int countLikeMyBlog(@Param("idBlog_") String idBlog);

    @Query(value = "select count(id_) " +
            "from like_ " +
            "where id_blog_ = :idBlog_ and status_delete_=1",nativeQuery = true)
    int countLikeByFriendBlog(@Param("idBlog_") String idBlog_);

    @Query(value = "select l.id_ " +
            "from like_ l " +
            "where id_blog_ = :idBlog_ and status_delete_=1 and id_user_ = :idUser_",nativeQuery = true)
    Tuple checkLikeByUser(@Param("idBlog_") String idBlog_,
                          @Param("idUser_") String idUser_);
}
