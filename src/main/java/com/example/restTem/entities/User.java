package com.example.restTem.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Entity
@Data

public class User {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer id;
        private String name;
        @Column(unique = true)
        private String email;
        private String address;

        public User(){

        }

        public User(Integer id, String name, String email, String address) {
                this.id = id;
                this.name = name;
                this.email = email;
                this.address = address;
        }
}
