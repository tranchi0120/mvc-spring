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
    @RequestMapping("/")
    @GetMapping("/")
    public String getAllUser(Model model)  {
        List<User> listUser = userService.getAll();
        model.addAttribute("users", listUser);
        return "home";
    }

    @GetMapping("/addUser")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/";
    }

    @GetMapping("/editUser/{id}")
    public String getUserId(@PathVariable("id") Integer id, Model model) {
        User user = userService.getUserId(id);
        model.addAttribute("user", user);
        return "addUser";
    }

    @PutMapping("/update/{id}")
    public String updateUser(@ModelAttribute User user, @PathVariable("id") Integer id, Model model) {
        User updatedUser = userService.updateUser(id, user);
        if (updatedUser != null) {
            model.addAttribute("message", "User updated successfully");
        } else {
            model.addAttribute("error", "User not found or update failed");
        }
        return "redirect:/";
    }
}

