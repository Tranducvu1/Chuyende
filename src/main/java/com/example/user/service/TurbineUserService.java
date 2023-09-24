package com.example.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.user.models.TurbineUser;
import com.example.user.repository.TurbineUserRepository;

@Service
public class TurbineUserService {
    @Autowired
    private TurbineUserRepository turbineUserRepository;

    public List<TurbineUser> getTurbineUsers() {
        return turbineUserRepository.findAll();
    }

    public void saveTurbineUser(TurbineUser turbineUser) {
        if (turbineUser.getEipMPost().getCompanyId() != null) {
            turbineUserRepository.save(turbineUser);
        } else {
            throw new IllegalArgumentException("Company is required for user");
        }
    }
   public List<TurbineUser> searchByKeyword(String Keyword) {
		 return turbineUserRepository.searchByKeyword(Keyword);
	 }
}