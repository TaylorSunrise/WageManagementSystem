package com.love.meat.dao;

import com.love.meat.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Taylor
 * @time 2020-07-22
 */
@Mapper
public interface AdminDao {
    Admin getAdminByUsername(String username);
}
