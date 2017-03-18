/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filter.controller;

import com.filter.dao.UserDao;
import com.fitler.entity.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */

public class UserListController extends Controller {

    //====dependencies==============
    
    private UserDao ud;
    public UserListController() {
       
    }

    @Override
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       ud=new UserDao();
      List<User> userList= ud.getAllUser();
      req.setAttribute("userList",userList);
      req.getRequestDispatcher(req.getContextPath()+"/admin/user-list.jsp").forward(req, resp);


    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       ud=new UserDao();
      List<User> userList= ud.getAllUser();
      req.setAttribute("userList",userList);
      req.getRequestDispatcher(req.getContextPath()+"/admin/user-list.jsp").forward(req, resp);


    }
    
    
    
    
    
}
