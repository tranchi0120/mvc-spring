package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String saveUser(@ModelAttribute("user") @Valid User user, Model model) {
        if (userService.emailExists(user.getEmail())) {
            model.addAttribute("error", "Email đã được sử dụng. Vui lòng chọn một email khác.");
            return "user_form";
        }
        userService.save(user);
        return "redirect:/";
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

