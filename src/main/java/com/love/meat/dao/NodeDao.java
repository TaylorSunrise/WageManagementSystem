package com.love.meat.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import javax.xml.soap.Node;
import java.util.List;
import java.util.logging.Filter;

/**
 * @author Taylor
 * @time 2020-10-22
 */
@Mapper
public interface NodeDao {
    Integer insertNode(Node node);
    List<Node> getAllNode(String uuid);
    boolean updateNodeNextId(@Param("id") Integer id, @Param("nextid") Integer nextid);

    Node getNodeByFilter(Filter filter);
}
