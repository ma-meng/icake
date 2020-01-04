package com.ma.icake.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter{
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    /*如果session域中有用户，判断为已登录，放行访问链接
    如果session中没有用户，表示未登录，重定向到登录页面进行登录*/
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        Object object = request.getSession().getAttribute("ACCOUNT");
        if(object==null){
            response.sendRedirect("/toLogin.do");
        }else{
            filterChain.doFilter(request,response);
        }
    }

    public void destroy() {
    }
}
