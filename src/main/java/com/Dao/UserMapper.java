package com.Dao;

import java.util.List;

import com.Entity.User;

/**
 * @author zhang
 */
public interface UserMapper {

    /**获取用户列表
     * @return
     */
    public List<User> getUserList();


    /**
     * 查询用户
     * @param id
     * @return
     */
    public User getUserById(int id);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public int insertUser(User user);

    /**
     * 修改个人信息
     * @return
     */
    public int upUser(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    public int uppaw(User user);
}
