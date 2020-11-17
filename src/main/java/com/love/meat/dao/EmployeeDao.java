package com.love.meat.dao;

import com.love.meat.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Taylor
 * @time 2020-07-24
 */
@Mapper
public interface EmployeeDao {
    List<Employee> getEmployeesByStatus(int status);
    List<Employee> getEmployees();
    List<Department> getDepartments();
    List<WageStruct> getWageStruct();
    void insertEmployee(Employee employee);
    Employee getEmployeeById(Integer id);
    void updateEmployeeById(@Param("id") Integer id,@Param("isdelete") Integer isdelete);
    void updateEmployee(Employee employee);
    List<Employee> getEmployeesByType(Integer type);

    List<SampleSalary> getEmployeeSalaryByType(Integer type);

    List<Info> getTests();
    List<Info> getTestsByMonth(@Param("month") Integer month,@Param("type") Integer type);
    List<Info> getTestsByMonth2(@Param("month") Integer month);
    List<Info> getTestsByType(@Param("type") Integer type);
    List<Info> getTestByInfo(@Param("id") Integer id);

    void insertData(@Param("datas") List<StructData> datas);

}
