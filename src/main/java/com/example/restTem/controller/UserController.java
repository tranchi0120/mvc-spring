package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @GetMapping("/")
    public ModelAndView getAllUser(){
        ModelAndView mav = new ModelAndView("home");
        List<User> userList = userService.getAll();
        System.out.println("userList: "+userList);
        return mav;
    }
}
