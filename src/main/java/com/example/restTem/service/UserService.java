package com.example.restTem.service;

import com.example.restTem.entities.User;
import com.example.restTem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public List<User> getAll() {
        return userRepository.findAll();
    }

    public User addUser(User user) {
        return userRepository.save(user);


    }

    public User getUserId(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    public User update(Integer userId, User user) {
        Optional<User> optionalUser = userRepository.findById(userId);

        if (optionalUser.isPresent()) {
            User StaffUserUpdate = optionalUser.get();
            StaffUserUpdate.setName(user.getName());
            StaffUserUpdate.setEmail(user.getEmail());
            StaffUserUpdate.setAddress(user.getAddress());
            return userRepository.save(StaffUserUpdate);
        } else {
            return null;
        }
    }


    public boolean deleteUser(Integer id) {
        if(userRepository.existsById(id)){
            userRepository.deleteById(id);
            return true;
        }else{
            return false;
        }

    }

    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }

}
