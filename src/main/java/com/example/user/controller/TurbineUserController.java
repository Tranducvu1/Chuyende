package com.example.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.user.models.TurbineUser;
import com.example.user.service.EipMPostService;
import com.example.user.service.TurbineUserService;

@Controller
public class TurbineUserController {

    @Autowired
    private TurbineUserService turbineUserService;
    @Autowired
    private EipMPostService eipMPostService;

    @GetMapping("/user")
    public String index(ModelMap modalmap, @RequestParam(value = "keyword", required = false) String keyword) {
        List<TurbineUser> turbineUsers;
        if (keyword != null && !keyword.isEmpty()) {
            turbineUsers = turbineUserService.searchByKeyword(keyword);
        } else {
            turbineUsers = turbineUserService.getTurbineUsers();
        }
        modalmap.addAttribute("turbine", turbineUsers);

        return "tables"; 
    }
    @PostMapping("/user")
    public String addUser(@ModelAttribute("turbineUser") TurbineUser turbineUser, @RequestParam(name = "isAdmin", required = false) Boolean isAdminValue) {
        if (isAdminValue != null) {
            turbineUser.setIsAdmin(isAdminValue);
        } else {
            turbineUser.setIsAdmin(false);
        }
        if (turbineUser.getEipMPost().getCompanyId() == null) {
            turbineUser.getEipMPost().setCompanyId(1);
        }
        turbineUserService.saveTurbineUser(turbineUser);
        return "tables";
    }
}
