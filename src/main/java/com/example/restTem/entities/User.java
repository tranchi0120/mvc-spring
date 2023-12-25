package com.example.restTem.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Entity
@Data
public class User {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer id;
        @NotEmpty(message = "Tên không được trống")
        @Pattern(regexp = "^[a-zA-Z]*",message = "Tên không được trống")
        private String name;
        private String email;
        private String address;

}
