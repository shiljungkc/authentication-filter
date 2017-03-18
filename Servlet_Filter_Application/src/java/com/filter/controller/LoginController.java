/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filter.controller;

import com.filter.dao.UserDao;
import com.fitler.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "loginController",urlPatterns = {"/admin/login"})
public class LoginController extends Controller{
    
    
    //===== dependencies==============
    
    private UserDao ud;
    public LoginController() {
       ud=new UserDao();
    }

    public  UserDao getUd() {
        return ud;
    }
    
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             req.setAttribute("userList", ud.getAllUser());
             req.getRequestDispatcher("user-list.jsp").forward(req, resp);
        


    }

   
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        
        String userName=req.getParameter("userName");
        String password=req.getParameter("password");
        
       User u= ud.loginCheck(userName, password);
       if(u!=null)
       {
           if(u.getStatus()==true)
           {
               
             HttpSession ses=req.getSession(true);
             ses.setAttribute("userName",userName);
             ses.setAttribute("password",password);
             
             req.setAttribute("userList", ud.getAllUser());
             req.getRequestDispatcher("user-list.jsp").forward(req, resp);
//      req.getRequestDispatcher(req.getContextPath()+"/admin/userList").forward(req, resp);
             
             
           }
           else
           {
               resp.sendRedirect(req.getContextPath()+"/admin/login.jsp?inactive");
           }
       }
       else
       {
           resp.sendRedirect(req.getContextPath()+"/admin/login.jsp?error");
       }
    }    
    
}
