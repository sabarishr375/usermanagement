package com.codewith.firstApp.repository;

import com.codewith.firstApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
