package com.Filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author zhang
 */
public class LoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    /**
     * 通过session验证是否登录，否则重定向到登录页面
     * @param servletRequest
     * @param servletResponse
     * @param filterChain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
        throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        // 获取客户端所请求的脚本文件的文件路径
        String servletPath = request.getServletPath();
        if (servletPath.equals("/login.jsp") || servletPath.equals("/Login") || servletPath.equals(".js")
            || servletPath.equals(".css") || servletPath.equals(".png")) {
            filterChain.doFilter(request, response);
        } else {
            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                // 没有登录
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                filterChain.doFilter(request, response);

            }
        }
    }

    @Override
    public void destroy() {

    }
}
