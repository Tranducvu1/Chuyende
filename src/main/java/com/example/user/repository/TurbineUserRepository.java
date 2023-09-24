package com.example.user.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.example.user.models.TurbineUser;

@Repository
public interface TurbineUserRepository extends JpaRepository<TurbineUser, Integer> {

	 
		@Query("SELECT tu FROM TurbineUser tu WHERE tu.loginName LIKE %:keyword% OR tu.firstName LIKE %:keyword% ")
		 List<TurbineUser> searchByKeyword(String keyword);
}
