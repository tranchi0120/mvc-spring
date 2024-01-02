package com.example.restTem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")

public class ViewController {
    @GetMapping("/listUser")
    public String getListUser() {
        return "listUser";
    }

    @GetMapping("/addUser")
    public String addUser() {
        return "userForm";
    }

}
