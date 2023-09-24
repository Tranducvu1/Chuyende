package com.example.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.user.models.EipMPost;

@Repository
public interface EipMPostRepository extends JpaRepository<EipMPost, Integer>{

}
