package com.ma.icake.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter implements Filter {
   /* 设置默认的编码*/
    private String encoding = "UTF-8";

    public void init(FilterConfig filterConfig) throws ServletException {
       /* 判断一下配置文件中有没有设置编码格式
          如果有，则使用配置的
          如果没有，则使用默认值UTF-8*/
        if(filterConfig.getInitParameter("encoding")!=null)
            encoding = filterConfig.getInitParameter("encoding");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
       /* 设置request和response的编码格式，并放行访问链接*/
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);
        filterChain.doFilter(request,response);
    }

    public void destroy() {
    }
}
