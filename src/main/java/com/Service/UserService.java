package com.Service;

import java.util.List;

import com.Entity.User;

/**
 * @author zhang
 */
public interface UserService {

    public List<User> getUserList();

    public int insertUser(User user);

    public int upUser(User user);

    public int uppaw(User user);

    public User getUserById(int id);
}
