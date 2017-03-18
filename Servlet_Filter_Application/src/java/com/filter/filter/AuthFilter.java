/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filter.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebFilter(filterName = "authFilter", urlPatterns = "/admin/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        if (req.getSession() != null && req.getSession().getAttribute("userName") != null) {
            if ((req.getRequestURL().toString()).contains("admin/login")) {
                
                req.getRequestDispatcher("/admin/login").forward(request, response);
//                resp.sendRedirect(req.getContextPath() + "/admin/user-list.jsp");

            }

            chain.doFilter(req, resp);
            
        } else {
            if ((req.getRequestURL().toString()).contains("admin/login")) {
                chain.doFilter(req, resp);

            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/login.jsp");
            }

        }

    }

    @Override
    public void destroy() {
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
