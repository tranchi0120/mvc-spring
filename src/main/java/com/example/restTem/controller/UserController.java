package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String getAllUser(Model model) {
        List<User> listUser = userService.getAll();
        model.addAttribute("listUser", listUser);
        model.addAttribute("Users", new User());
        return "home";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User newUser, Model model) {
        userService.addUser(newUser);
        model.addAttribute("Users", new User());
        return "redirect:/";
    }

    @GetMapping("/editUser/{id}")
    public String getUserId(@PathVariable("id") Integer id, Model model) {
        User user = userService.getUserId(id);
        model.addAttribute("getUserItem", user);
        return "modelUpdate";
    }

    @PutMapping("/updateUser/{id}")
    public String updateUser(@PathVariable("id") Integer id, @ModelAttribute User user) {
        userService.updateUser(id, user);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
        return "redirect:/";
    }
}

