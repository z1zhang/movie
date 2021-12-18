package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.UserMapper;
import com.Entity.User;

/**
 * @author zhang
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int upUser(User user) {
        return userMapper.upUser(user);
    }

    @Override
    public int uppaw(User user) {
        return userMapper.uppaw(user);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    // public void setUserMapper(UserMapper userMapper) {
    // this.userMapper=userMapper;
    // }
}
