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
            "where id_blog_ = :idBlog_",nativeQuery = true)
    int countHeartMyBlog(@Param("idBlog_") String idBlog);
}
