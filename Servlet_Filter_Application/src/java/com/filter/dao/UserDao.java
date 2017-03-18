/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filter.dao;

import com.fitler.entity.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class UserDao{
    List<User> userList;

    public UserDao() {
        userList=new ArrayList();
        userList.add(new User("sushil","sushil",true));
        userList.add(new User("sunil","sunil",false));
        userList.add(new User("roshan","roshan",true));
        userList.add(new User("pradip","pradip",false));
        userList.add(new User("nabina","nabina",true));
    }
    public Boolean insert(String userName,String password,Boolean status)
    {
        userList.add(new User(userName,password,status));
        return true;
        
    }
    public User loginCheck(String userName, String password)
    {
        for(User u:userList)
        {
            if(userName.equals(u.getUserName()) && password.equals(u.getPassword()))
            {
                return u;
            }
        }
        return null;
        
    }
    
    public List<User> getAllUser()
    {
        return userList;
    }
    
    
//    public Boolean updateByUserName(String oldUserName,String nuUserName)
//    {
//        for(User u:userList)
//        {
//            if(oldUserName.equals(u.getUserName()))
//            {
//                
//                u.setUserName(nuUserName);
//                return u;
//            }
//        }
//        return null;
//        
//    }
    public Boolean deleteByUserName(String userName)
    {
        for(User u:userList)
        {
            if(userName.equals(u.getUserName()))
            {
                userList.remove(u);
                return true;
            }
        }
        return false;
        
    }
    public User serachByUserName(String userName)
    {
        for(User u:userList)
        {
            if(userName.equals(u.getUserName()))
            {
                return u;
            }
           
        }
        return null;
    }
    
    
    
    
}
