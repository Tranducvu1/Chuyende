package com.example.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.user.models.EipMPost;
import com.example.user.repository.EipMPostRepository;

@Service
public class EipMPostService {
@Autowired
private EipMPostRepository eipMPostRepository;

public List<EipMPost> geteipmpost (){
	return eipMPostRepository.findAll();
}
public void save(EipMPost eipMPost) {
	eipMPostRepository.save(eipMPost);
}

}
