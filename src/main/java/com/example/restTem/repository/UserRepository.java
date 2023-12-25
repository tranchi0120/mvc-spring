package com.example.restTem.repository;

import com.example.restTem.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    /* kiểm tra email có tính duy nhất không */
    Boolean existsByEmail(String email);


}
