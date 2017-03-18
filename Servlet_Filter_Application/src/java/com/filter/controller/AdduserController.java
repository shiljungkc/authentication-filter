/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filter.controller;

import com.filter.dao.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class AdduserController extends Controller {

    private UserDao ud;

    public AdduserController() {
        ud = new LoginController().getUd();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        

       ud.insert(req.getParameter("userName"), req.getParameter("password"), Boolean.TRUE);
       req.setAttribute("userList", ud.getAllUser());
       req.getRequestDispatcher("user-list.jsp").forward(req, resp);
       
    }

}
