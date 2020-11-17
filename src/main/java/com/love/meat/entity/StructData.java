package com.love.meat.entity;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author Taylor
 * @time 2020-08-23
 */
@Accessors(chain = true)
@Data
public class StructData {
    private Integer userid;
    private String record;
    private Integer month;
    private Integer struct;
}
