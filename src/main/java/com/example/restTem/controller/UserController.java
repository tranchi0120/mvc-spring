package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String getAllUser(Model model) {
        List<User> listUser = userService.getAll();
        model.addAttribute("users", listUser);
        return "home";
    }

    @GetMapping("/userForm")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user_form";
    }

    @PostMapping("/saveUser")
    public String saveUser(@Valid User user, BindingResult bindingResult) {
        // Kiểm tra và xử lý lưu dữ liệu
        if (bindingResult.hasErrors()) {
            return "user-form";
        } else {
            userService.save(user);
            return "redirect:/";
        }
    }

    @GetMapping("/editUser/{id}")
    public String getUserId(@PathVariable("id") Integer id, Model model) {
        User user = userService.getUserId(id);
        model.addAttribute("user", user);
        return "user_form";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
        return "redirect:/";
    }
}

