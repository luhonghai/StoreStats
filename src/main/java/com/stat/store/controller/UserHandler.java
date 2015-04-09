package com.stat.store.controller;

import com.stat.store.entity.User;
import com.stat.store.exception.DAOException;
import com.stat.store.service.UserService;
import com.stat.store.util.MD5Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by longnguyen on 4/6/15.
 */
@WebServlet(name = "UserHandler", asyncSupported = true, urlPatterns = {"/UserHandler"})
public class UserHandler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        UserService userService = new UserService();
        try {
            out = response.getWriter();

            String action = request.getParameter("action");

            if(action.equalsIgnoreCase("login")){
                String username = request.getParameter("_request_username");
                String password = request.getParameter("_request_password");


                User member = userService.login(username, password);

                if(member != null){
                    HttpSession session = request.getSession();
                    session.setAttribute("member", member);

                    response.sendRedirect("index.jsp");
                }else{
                    out.print("invalid");
                }
            }else if(action.equalsIgnoreCase("register")){
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");

                User member = new User();
                member.setUsername(username);
                member.setPassword(MD5Helper.md5(password));
                member.setFirstname(fname);
                member.setLastname(lname);
                member.setEmail(email);
                member.setRoleId(2); //1 = Admin - 2 = Engineer

                if(userService.doRegister(member) != null){
                    out.print("done");
                }else{
                    out.print("invalid");
                }
            }
        } catch (DAOException e) {
            e.printStackTrace();
        } finally{
            if(out != null)
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
