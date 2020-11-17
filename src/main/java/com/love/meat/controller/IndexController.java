package com.love.meat.controller;

import com.love.meat.dao.EmployeeDao;
import com.love.meat.entity.Department;
import com.love.meat.entity.Employee;
import com.love.meat.entity.WageStruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @author Taylor
 * @time 2020-07-24
 */
@Controller
public class IndexController {

    @Autowired
    EmployeeDao dao;

    @GetMapping("index")
    public String index(ModelMap map){
        List<Employee> employees = dao.getEmployees();
        map.put("employees",employees);
        return "index";
    }

    @GetMapping("edit")
    public String edit(ModelMap map){
        List<WageStruct> wageStructs = dao.getWageStruct();
        List<Department> departments = dao.getDepartments();
        map.put("wageStructs",wageStructs);
        map.put("departments",departments);
        return "edit";
    }
}
