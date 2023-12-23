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

    public void addUser(User user) {
        userRepository.save(user);
    }

    public User getUserId(Integer id) {
        return userRepository.findById(id).get();
    }

    public void updateUser(Integer id, User updatedUser) {
        Optional<User> optionalUser = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            User userUpdate = optionalUser.get();
            userUpdate.setName(updatedUser.getName());
            userUpdate.setEmail(updatedUser.getEmail());
            userUpdate.setAddress(updatedUser.getAddress());
            userRepository.save(userUpdate);
        } else {
            System.out.println("loi khi update");
        }
    }


    public void deleteUser(Integer id){
         userRepository.deleteById(id);
    }

}
