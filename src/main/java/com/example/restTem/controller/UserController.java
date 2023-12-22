package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String getAllUser(Model model)  {
        List<User> listUser = userService.getAll();
        model.addAttribute("listUser", listUser);
        model.addAttribute("Users", new User());
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
        model.addAttribute("Users", user);
        return "addUser";
    }


    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
        return "redirect:/";
    }
}

