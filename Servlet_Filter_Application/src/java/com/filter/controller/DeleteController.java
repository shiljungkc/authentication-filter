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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class DeleteController extends Controller {
    private LoginController lc ;
    private UserDao ud;
    

    public DeleteController() {
        lc=new LoginController();
        ud=lc.getUd();
        
        
    }
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        
        
        ud.deleteByUserName(req.getParameter("un"));
        List<User> u=ud.getAllUser();
        req.setAttribute("userList", u);
        req.getRequestDispatcher("user-list.jsp").forward(req, resp);
        
        


    }
    
    
}
