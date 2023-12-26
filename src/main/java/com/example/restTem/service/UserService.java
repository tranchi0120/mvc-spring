package com.example.restTem.service;

import com.example.restTem.entities.User;
import com.example.restTem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;


    public List<User> getAll() {
        return userRepository.findAll();
    }

    public void save(User user) {
        if (user.getId() == null) {
            if (userRepository.existsByEmail(user.getEmail())) {
                return;
            }
            userRepository.save(user);
        } else {
            User staffUpdate = userRepository.findById(user.getId()).orElse(null);
            if (staffUpdate != null) {
                staffUpdate.setName(user.getName());
                staffUpdate.setAddress(user.getAddress());
                staffUpdate.setEmail(user.getEmail());
                userRepository.save(staffUpdate);
            }
        }
    }


    public User getUserId(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }

}
