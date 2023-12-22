package com.example.restTem.service;

import com.example.restTem.entities.User;
import com.example.restTem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public void save(User user) {
        if (user.getId() == null) {
            userRepository.save(user);
        } else {
            User staffUpdate = userRepository.findById(user.getId()).get();
            staffUpdate.setName(user.getName());
            staffUpdate.setAddress(user.getAddress());
            staffUpdate.setEmail(user.getEmail());
            userRepository.save(staffUpdate);
        }
    }

    public List<User> getAll() {
        return userRepository.findAll();
    }

    public User getUserId(Integer id) {
        return userRepository.findById(id).get();
    }

    public User updateUser(Integer id, User updatedUser) {
        User existingUser = userRepository.findById(id).orElse(null);

        if (existingUser != null) {
            existingUser.setName(updatedUser.getName());
            existingUser.setEmail(updatedUser.getEmail());

            return userRepository.save(existingUser);
        }

        return null;
    }


}
