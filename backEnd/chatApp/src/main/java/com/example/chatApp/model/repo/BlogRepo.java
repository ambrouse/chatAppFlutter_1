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
            "where b.id_user_ = :idUser_ and b.status_delete_=1",nativeQuery = true)
    List<Tuple> getMyBlog(@Param("idUser_") String idUser_);

    @Query(value = "select id_ as id_, title_ as title_, content_ as content_ " +
            "from blog_ " +
            "where id_ = :idMyBlog_ and status_delete_=1",nativeQuery = true)
    Tuple getMyBlogDetail(@Param("idMyBlog_") String idMyBlog_);


    @Query(value = "select b.id_ as id_,cast(b.title_ as nvarchar(50)) as titleMini_, cast(b.content_ as nvarchar(100)) as contentMini_, b.title_ as title_, b.content_ as content_  " +
            "from link_user_ l, blog_ b " +
            "where l.id_user_ = :idUser_ and (b.id_user_ = l.id_user_friend_ or b.id_user_ = :idUser_) and l.status_delete_ = 1 and b.status_delete_ = 1 " +
            "order by b.day_blog_ asc",nativeQuery = true)
    List<Tuple> getBlogFriend(@Param("idUser_") String idUser_);
}
