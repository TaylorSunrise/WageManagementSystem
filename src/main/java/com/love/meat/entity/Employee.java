package com.love.meat.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author Taylor
 * @time 2020-07-24
 */
@Data
public class Employee{
    private Integer id;
    private String username;
    private Date createtime;
    private String wagestruct;
    private String department;
    private String sex;
    private Integer isdelete;
}
