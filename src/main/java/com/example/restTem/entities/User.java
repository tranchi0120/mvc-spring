package com.example.restTem.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Entity
@Data
public class User {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer id;
        @NotEmpty(message = "Tên không được trống")
        @NotNull(message = "Title is required")
        private String name;
        @Column(unique = true)
        private String email;
        @NotEmpty(message = "Tên không được trống")
        private String address;

}
