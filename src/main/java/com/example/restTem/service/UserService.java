package com.example.restTem.service;

import com.example.restTem.entities.User;
import com.example.restTem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.awt.print.Pageable;
import java.util.List;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public boolean save(User user) {

        if (user.getId() == null) {
            if(userRepository.existsByEmail(user.getEmail())){
                return false;
            }
            userRepository.save(user);
        } else {
            User staffUpdate = userRepository.findById(user.getId()).get();
            staffUpdate.setName(user.getName());
            staffUpdate.setAddress(user.getAddress());
            staffUpdate.setEmail(user.getEmail());
            userRepository.save(staffUpdate);
        }
        return true;
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
            existingUser.setAddress(updatedUser.getAddress());
            return userRepository.save(existingUser);
        }

        return null;
    }


    public void deleteUser(Integer id){
         userRepository.deleteById(id);
    }

    public Page<User> pagination(Pageable pageable){
        userRepository.findAll((Sort) pageable);
        return null;
    }



}
