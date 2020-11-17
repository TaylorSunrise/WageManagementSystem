package com.love.meat.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.love.meat.dao.EmployeeDao;
import com.love.meat.entity.*;
import com.love.meat.util.Utils;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.function.Function;

/**
 * @author Taylor
 * @time 2020-07-25
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeDao dao;

    @PostMapping("/add")
    public String addEmployee(Employee employee, RedirectAttributes attributes){
        System.out.println(employee);
        if(StringUtils.isBlank(employee.getUsername())){
            attributes.addFlashAttribute("baseResult", BaseResult.fail("姓名不能为空"));
            return "redirect:/edit";
        } else {
            if (employee.getCreatetime() == null){
                employee.setCreatetime(new Date());
            }
            employee.setIsdelete(0);
            dao.insertEmployee(employee);
            attributes.addFlashAttribute("baseResult", BaseResult.success("添加员工成功"));
            return "redirect:/index";
        }
    }

    @GetMapping("/editemployee/{id}")
    public String editEmployee(@PathVariable("id") Integer id, RedirectAttributes attributes) {
        Employee employeeById = dao.getEmployeeById(id);
        attributes.addFlashAttribute("employeeById",employeeById);
        return "redirect:/edit";
    }

    @GetMapping("/changeemployee/{id}/{isdelete}")
    public String deleteEmployee(@PathVariable("id") Integer id, @PathVariable("isdelete") Integer isdelete, RedirectAttributes attributes) {
        dao.updateEmployeeById(id,isdelete == 1 ? 0 : 1);
        attributes.addFlashAttribute("baseResult",BaseResult.success("员工"+ ((isdelete == 1) ? "复职" : "离职")  +"成功"));
        return "redirect:/index";
    }

    @PostMapping("/update")
    public String updateEmployee(Employee employee,  RedirectAttributes attributes){
        dao.updateEmployee(employee);
        attributes.addFlashAttribute("baseResult",BaseResult.success("员工更新成功"));
        return "redirect:/index";
    }

    @GetMapping("/getEmployeeByType/{type}")
    public String getEmployeeByType(@PathVariable("type") Integer type, ModelMap map){
        int wage[] = new int[]{20,1,200,200};
        List<SampleSalary> employeeSalaryByType = dao.getEmployeeSalaryByType(type);
        for (SampleSalary sampleSalary : employeeSalaryByType) {
            sampleSalary.setTotal(Utils.getTotal(sampleSalary.getRecord(),Utils.getCount(type)));
            sampleSalary.setSalary(sampleSalary.getTotal() * wage[type - 1]);
        }
        map.put("employees",employeeSalaryByType);
        map.put("titles", Utils.type[type - 1]);
        map.put("type", type);
        return "typedata";
    }

    /**
     * 具体某一个人某个月的工资条
     * @param id
     * @param resp
     * @throws IOException
     */
    @GetMapping("/downloadBySalaryId/{id}")
    public void downloadBySalaryId(@PathVariable("id") Integer id,HttpServletResponse resp) throws IOException {
        List<Info> testByInfo = dao.getTestByInfo(id);
        down(resp,testByInfo.get(0).getUsername() + testByInfo.get(0).getMonth() + "月工资条",testByInfo);
    }

    /**
     * 某个类型的工资条汇总
     * @param type
     * @param response
     * @throws IOException
     */
    @GetMapping("/downloadByType/{type}")
    public void downloadByType(@PathVariable("type") Integer type, HttpServletResponse response) throws IOException {
        List<Info> testsByMonth = dao.getTestsByType(type);
        down(response,Utils.wageName[type - 1] + "工资条汇总",testsByMonth);
    }

    /**
     * 整个月某种工资结构汇总
     * @param type
     * @param month
     * @param response
     * @throws IOException
     */
    @GetMapping("/downloadFailedUsingJson/{month}/{type}")
    public void downloadFailedUsingJson(@PathVariable("type") Integer type,@PathVariable("month") Integer month, HttpServletResponse response) throws IOException {
        List<Info> testsByMonth = dao.getTestsByMonth(month, type);
        down(response,month + "月" + Utils.wageName[type - 1] + "工资条汇总",testsByMonth);
    }

    /**
     * 整月所有工资条汇总
     * @param month
     * @param response
     * @throws IOException
     */
    @GetMapping("/downloadFailedUsingJson/{month}")
    public void downloadFailedUsingJson(@PathVariable("month") Integer month, HttpServletResponse response) throws IOException {
        List<Info> testsByMonth = dao.getTestsByMonth2(month);
        down(response, month + "月"  + "工资条汇总",testsByMonth);
    }



    private void down(HttpServletResponse response,String name,List<Info> tests) throws IOException {
        int wage[] = new int[]{20,1,200,200};
        try {
            List<Day> days = new ArrayList<>();
            for (Info test : tests) {
                Day day = new Day();
                day.setUsername(test.getUsername());
                day.setStruct(test.getStruct());
                day.setMonth(test.getMonth());
                day.setId(test.getId());
                String record = test.getRecord();
                day = Utils.valueToObject(day,record, Utils.getCheckMethod(test.getType()));
                int total = Integer.parseInt(day.getTotal());
                day.setShouldSalary("" + (total * wage[test.getType() - 1]));
                day.setTrueSalary("" + (total * wage[test.getType() - 1]));
                day.setTotal(day.getTotal() + Utils.wageType[test.getType() - 1]);
                days.add(day);
            }
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
            String fileName = URLEncoder.encode(name, "UTF-8");
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            // 这里需要设置不关闭流
            EasyExcel.write(response.getOutputStream(), Day.class).autoCloseStream(Boolean.FALSE).sheet("工资条")
                    .doWrite(days);
        } catch (Exception e) {
            // 重置response
            response.reset();
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            Map<String, String> map = new HashMap<String, String>();
            map.put("status", "failure");
            map.put("message", "下载文件失败" + e.getMessage());
            ObjectMapper objectMapper = new ObjectMapper();
            response.getWriter().println(objectMapper.writeValueAsString(map));
        }
    }

    @GetMapping("/insertdata")
    public void insertData(){
        List<Employee> employees = dao.getEmployees();
        List<StructData> structDatas = new ArrayList<>();
        for (Employee employee : employees) {
            for (int i = 1; i <= 7; i++) {
                StructData sd = new StructData();
                sd.setUserid(employee.getId())
                .setMonth(i)
                .setStruct(random(4))
                .setRecord(getRecord(sd.getStruct()));
                structDatas.add(sd);
            }
        }
        dao.insertData(structDatas);
    }

    private Integer random(int i){
        return (int)(Math.random() * i) + 1;
    }

    private String getRecord(int struct){
        String str = "";
        for (int i = 1; i <= 31; i++) {
            str += i + "," + getCheckMethod(struct).apply(1) + "-";
        }
        return  str.substring(0,str.length() - 1);
    }

    private Function<Integer,Integer> getCheckMethod(int type){
        switch (type){
            case 1:
            case 2: return x -> random(100);
            case 3:
            case 4: return x -> random(100) == 1 ? 0 : 1;
            default: return x -> x;
        }
    }

}
