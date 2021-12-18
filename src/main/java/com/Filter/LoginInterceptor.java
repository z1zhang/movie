package com.Filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author zhang
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 预处理，过滤掉css js png jpg等格式
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws IOException, ServletException {
        if (request.getRequestURI().contains(".js") || request.getRequestURI().contains(".css")
            || request.getRequestURI().contains(".png") || request.getRequestURI().contains(".jpg")) {
            return true;
        }
        HttpSession session = request.getSession();

        if (session.getAttribute("user") != null) {
            return true;
        }

        request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
        ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
        Object o, Exception e) throws Exception {

    }

}
