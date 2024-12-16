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

    @Query(value = "select id_ as id_, title_ as title_, content_ as content_, link_img_ as linkImg_ " +
            "from blog_ " +
            "where id_ = :idMyBlog_ and status_delete_=1",nativeQuery = true)
    Tuple getMyBlogDetail(@Param("idMyBlog_") String idMyBlog_);


    @Query(value = "select b.id_ as id_,cast(b.title_ as nvarchar(50)) as titleMini_, cast(b.content_ as nvarchar(100)) as contentMini_, b.title_ as title_, " +
            "b.content_ as content_, u.name_ as name_, b.link_img_ as linkImgBlog_, u.link_img_ as LinkImgUser_ " +
            "from blog_ b, user_ u " +
            "where b.status_delete_ = 1 and u.id_ = b.id_user_ and u.id_ =  :idUser_ " +
            "order by b.day_blog_ asc",nativeQuery = true)
    List<Tuple> getBlogFriend(@Param("idUser_") String idUser_);
}
