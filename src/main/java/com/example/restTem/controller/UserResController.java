package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;


import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/users")
public class UserResController {

    @Autowired
    private UserService userService;

    @GetMapping()
    public ResponseEntity<List<User>> userList() {
        List<User> users = userService.getAll();
        if (users.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } else {
            return ResponseEntity.ok(users);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable("id") Long id) {
        Optional<User> userOptional = Optional.ofNullable(userService.getUserId(id));

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            return ResponseEntity.status(HttpStatus.OK).body(user);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping("/addUser")
    public ResponseEntity<User> addUser(@RequestBody User user) {
        // Kiểm tra xem email đã tồn tại hay chưa
        if (userService.emailExists(user.getEmail())) {
            // 409 Conflict - Email đã tồn tại
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
        User newUser = userService.addUser(user);
        if (newUser != null) {
            // 201 Created - Thêm người dùng thành công
            return ResponseEntity.status(HttpStatus.CREATED).body(newUser);
        } else {
            // 500 Internal Server Error - Lỗi trong quá trình thêm người dùng
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable("id") Integer userId, @RequestBody User user) {
        User updateUserResult = userService.update(userId, user);
        if (updateUserResult != null) {
            return new ResponseEntity<>(updateUserResult, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable("id") Integer userId) {
        boolean deleted = userService.deleteUser(userId);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
