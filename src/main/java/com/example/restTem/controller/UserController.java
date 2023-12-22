package com.example.restTem.controller;

import com.example.restTem.entities.User;
import com.example.restTem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("/")
    @GetMapping("/")
    public String getAllUser(Model model)  {
        List<User> listUser = userService.getAll();
        System.out.println(listUser);
        model.addAttribute("users", listUser);
        return "home";
    }

    @GetMapping("/addUser")
    public ModelAndView addUser() {
        ModelAndView mav = new ModelAndView("addUser");
        mav.addObject("command", new User());
        return mav;
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/";
    }


}

