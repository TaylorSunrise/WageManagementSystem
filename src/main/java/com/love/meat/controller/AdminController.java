package com.love.meat.controller;

import com.love.meat.dao.AdminDao;
import com.love.meat.entity.Admin;
import com.love.meat.entity.BaseResult;
import com.love.meat.util.Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

/**
 * @author Taylor
 * @time 2020-07-22
 */
@Controller
public class AdminController {
    @Autowired
    private AdminDao dao;

    @GetMapping("/sys")
    public String test(){
        return "login";
    }
    @GetMapping("/test1")
    public String test1(){
        return "test";
    }

    @PostMapping("/login")
    @ResponseBody
    public BaseResult login(@RequestBody Admin login){
        String username = login.getUsername();
        if(StringUtils.isBlank(username) || StringUtils.isBlank(login.getPassword())){
            return BaseResult.fail("用户名或密码不能为空");
        }
        Admin admin = dao.getAdminByUsername(username);
        System.out.println(admin);
        if(admin == null || !Utils.StringToMD5(login.getPassword()).equals(admin.getPassword())){
            return BaseResult.fail("用户名或密码错误");
        }
        return BaseResult.success();
    }
}
