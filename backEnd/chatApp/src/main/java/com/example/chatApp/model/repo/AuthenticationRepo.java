package com.example.chatApp.model.repo;

import com.example.chatApp.model.entity.AuthenticationEntity;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AuthenticationRepo extends JpaRepository<AuthenticationEntity,String> {

    @Query(value = "select id_ " +
            "from authentication_ " +
            "where email_ = :email_ and status_delete_=1",nativeQuery = true)
    Tuple getAUByEmail(@Param("email_") String email_);

    @Query(value = "select id_ " +
            "from authentication_ " +
            "where email_ = :email_ and password_ = :password_ and status_delete_=1",nativeQuery = true)
    Tuple getAUByEmailPassword(@Param("email_") String email_,
                               @Param("password_") String password_);

}
