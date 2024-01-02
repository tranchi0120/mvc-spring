package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")

public class ViewController {

    @Autowired
    private UserService userService;

    @GetMapping("/listUser")
    public String getListUser() {
        return "listUser";
    }

    @GetMapping("/addUser")
    public String addUser() {
        return "userForm";
    }

    @GetMapping("/editUser/{id}")
    public String editUser(@PathVariable Long id) {
        return "userForm";
    }

}
