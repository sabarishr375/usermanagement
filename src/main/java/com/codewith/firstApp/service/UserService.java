package com.codewith.firstApp.service;

import com.codewith.firstApp.model.User;
import com.codewith.firstApp.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository repo;

    public UserService(UserRepository repo) {
        this.repo = repo;
    }

    public List<User> getAllUsers() {
        return repo.findAll();
    }

    public User createUser(User user) {
        return repo.save(user);
    }

    public Optional<User> getUserById(Long id) {
        return repo.findById(id);
    }

    public User updateUser(Long id, User userDetails) {
        User user = repo.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        
        user.setUsername(userDetails.getUsername());
        user.setName(userDetails.getName());
        user.setEmail(userDetails.getEmail());
        
        return repo.save(user);
    }

    public void deleteUser(Long id) {
        User user = repo.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        repo.delete(user);
    }
}
