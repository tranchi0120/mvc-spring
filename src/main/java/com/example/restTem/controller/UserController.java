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
        model.addAttribute("user", new User());
        return "home";
    }

    @GetMapping("/getSingleUser/{id}")
    public String getSingleUser(@PathVariable("id") Integer id, Model model) {
        User user = userService.getUserId(id);
        if (user != null) {
            model.addAttribute("userEdit", user);
        } else {
            model.addAttribute("errorMessage", "Không tìm thấy người dùng với ID: " + id);
        }
        return "redirect:/";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User newUser) {
        userService.addUser(newUser);
        return "redirect:/";
    }

    @PutMapping("/updateUser/{id}")
    public String updateUserData(@PathVariable("id") Integer id, @ModelAttribute User updatedUser) {
        userService.updateUser(id, updatedUser);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteUserData(@PathVariable Integer id) {
        userService.deleteUser(id);
        return "redirect:/";
    }


}
