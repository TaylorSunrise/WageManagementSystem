package com.love.meat.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadFontStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import lombok.Data;
import lombok.ToString;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;

/**
 * @author Taylor
 * @time 2020-08-12
 */
@Data
@ExcelIgnoreUnannotated
@ToString
@HeadFontStyle(bold=true)
@HeadStyle(horizontalAlignment= HorizontalAlignment.CENTER,verticalAlignment= VerticalAlignment.CENTER,fillBackgroundColor=-1)
@ContentStyle(horizontalAlignment= HorizontalAlignment.CENTER)
public class Info {
    @ExcelProperty(value = {"id"},index = 0)
    protected Integer id;
    @ExcelProperty(value = {"用户名"},index = 1)
    protected String username;
    protected String record;
    @ExcelProperty(value = {"月份"},index = 2)
    protected Integer month;
    @ColumnWidth(15)
    @ExcelProperty(value = {"工资构成"},index = 3)
    protected String struct;
    private Integer type;

    @ColumnWidth(15)
    @ExcelProperty(value = {"应发工资"},index = 36)
    protected String shouldSalary;
    @ColumnWidth(15)
    @ExcelProperty(value = {"实发工资"},index = 37)
    protected String trueSalary;
    @ColumnWidth(15)
    @ExcelProperty(value = {"考勤总结"},index = 35)
    protected String total;
}
