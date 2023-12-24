package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @GetMapping("/")
    public String getAllUser(Model model)  {
        List<User> listUser = userService.getAll();
        model.addAttribute("users", listUser);
        return "home";
    }

    @GetMapping("/addUser")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user_form";
    }

    @PostMapping("/saveUser")
    public String saveUser(User user, RedirectAttributes ra ) {
        userService.save(user);
        ra.addFlashAttribute("message", "The user has been saved successfully.");
        return "redirect:/";
    }

    @GetMapping("/editUser/{id}")
    public String getUserId(@PathVariable("id") Integer id, Model model) {
        User user = userService.getUserId(id);
        model.addAttribute("user", user);
        return "user_form";
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

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        userService.deleteUser(id);
        return "redirect:/";
    }


    @GetMapping("/page")
    public String paginate(Model model, @RequestParam("p") Optional<Integer> p){
        Pageable pageable = (Pageable) PageRequest.of(p.orElse(0), 10);
        Page<User> page = userService.pagination(pageable);
        model.addAttribute("LIST_USER", page);
        return "home";
    }
 }

