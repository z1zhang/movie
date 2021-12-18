package com.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Constants;
import com.Service.UserService;
import com.Entity.User;

/**
 * @author zhang
 */
@Controller
public class UserController {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping("/Login")
    public String getUserList(String username, String password, String code) {
        List<User> userList = userService.getUserList();
        for (User user : userList) {
            if (user.getUsername().equals(username) && user.getPaw().equals(password)) {
                HttpSession session = request.getSession();
                Object attribute = session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
                if (code.equals(attribute)) {
                    session.setAttribute("user", user);
                    return "main.jsp";
                } else {
                    request.setAttribute("mgs", "验证码错误");
                    return "login.jsp";
                }
            }
        }
        // System.out.println(user.getUsername()+"-----"+user.getPaw());
        request.setAttribute("mgs", "用户名或密码错误");
        return "login.jsp";
    }

    @RequestMapping("/exit")
    public String exit() {
        request.getSession().removeAttribute("user");
        return "login.jsp";
    }

    @RequestMapping("/register")
    public String insertUser(User user) {
        List<User> userList = userService.getUserList();
        for (User user1 : userList) {
            if (user1.getUsername().equals(user.getUsername())) {
                request.setAttribute("mgs1", "已经存在该用户");
                return "register.jsp";
            } else {
                request.setAttribute("mgs1", "添加成功");
                System.out.println(user);
                userService.insertUser(user);
                return "register.jsp";
            }
        }
        return "register.jsp";
    }

    @RequestMapping("/upUser")
    public String upUser(User user) {
        int i = userService.upUser(user);
        System.out.println(user + "-----" + i);
        if (i > 0) {
            User user1 = userService.getUserById(user.getId());
            request.getSession().setAttribute("user", user1);
            request.setAttribute("mgs4", "修改成功");
            return "user/UserDetail.jsp";
        } else {
            request.setAttribute("mgs4", "修改失败");
            return "user/UserDetail.jsp";
        }
    }

    /**
     * 修改密码
     *
     * @param user
     * @return
     */
    @RequestMapping("/uppaw")
    public String uppaw(User user, String paw1) {
        User userById = userService.getUserById(user.getId());
        if (userById.getPaw().equals(paw1)) {
            userService.uppaw(user);
            User user1 = userService.getUserById(user.getId());
            request.getSession().setAttribute("user", user1);
            request.setAttribute("mgs3", "修改密码成功");
            return "user/PwdUpdate.jsp";
        } else {
            request.setAttribute("mgs3", "输入原始密码不对");
            return "user/PwdUpdate.jsp";
        }
    }

}
