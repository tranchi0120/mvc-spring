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

    public boolean save(User user) {
        if (user.getId() == null) {
            if (isValidUser(user)) {
                return false;
            }
            if (userRepository.existsByEmail(user.getEmail())) {
                return false;
            }
            userRepository.save(user);
        } else {
            User staffUpdate = userRepository.findById(user.getId()).orElse(null);
            if (staffUpdate != null) {
                if (isValidUser(user)) {
                    return false;
                }
                staffUpdate.setName(user.getName());
                staffUpdate.setAddress(user.getAddress());
                staffUpdate.setEmail(user.getEmail());
                userRepository.save(staffUpdate);
            }
        }
        return true;
    }

    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }

    private boolean isValidUser(User user) {
        return isValidField(user.getName()) || isValidField(user.getEmail()) || isValidField(user.getAddress());
    }

    private boolean isValidField(String field) {
        return field == null || field.trim().isEmpty();
    }

    public List<User> getAll() {
        return userRepository.findAll();
    }

    public User getUserId(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }


    public Page<User> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }
}
