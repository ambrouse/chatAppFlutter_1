package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.BlogEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BlogRepo extends JpaRepository<BlogEntity,String> {

    @Query(value = "select b.id_ as id_, cast(b.title_ as nvarchar(50)) as title_, cast(b.content_ as nvarchar(100)) as content_ " +
            "from blog_ b " +
            "where b.id_user_ = :idUser_ ",nativeQuery = true)
    List<Tuple> getMyBlog(@Param("idUser_") String idUser_);
}
