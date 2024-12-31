package com.example.timetracking.repositories;

import com.example.timetracking.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Custom query methods (if needed)
    User findByEmail(String email);
}
