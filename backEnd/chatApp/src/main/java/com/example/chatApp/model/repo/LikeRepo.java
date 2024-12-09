package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.LikeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LikeRepo extends JpaRepository<LikeEntity,String> {
    @Query(value = "select COUNT(id_) " +
            "from like_ " +
            "where id_blog_ = :idBlog_ and status_delete_=1",nativeQuery = true)
    int countLikeMyBlog(@Param("idBlog_") String idBlog);
}
