package com.love.meat.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author Taylor
 * @time 2020-07-22
 */
@Data
public class Admin {
    private int id;
    private String username;
    private String password;
}
