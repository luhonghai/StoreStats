package com.stat.store.controller;

import com.stat.store.entity.AppIOs;
import com.stat.store.entity.User;
import com.stat.store.exception.DAOException;
import com.stat.store.service.AppleService;
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
 * Created by longnguyen on 4/9/15.
 */
@WebServlet(name = "AppIOSHandler", asyncSupported = true, urlPatterns = {"/AppIOSHandler"})
public class AppIOSHandler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        AppleService appleService = new AppleService();
        try {
            out = response.getWriter();

            String action = request.getParameter("action");
            String track_id = request.getParameter("track_id");

            HttpSession session = request.getSession();
            User member = (User)session.getAttribute("member");

            if(action.equalsIgnoreCase("follow")){
                //search app by service
                AppIOs app = appleService.getAppDetail(track_id);
                app.setUserId(member.getId());

                if(appleService.followApp(app) != null){
                    out.print("done");
                }else{
                    out.print("invalid");
                }
            }else if(action.equalsIgnoreCase("unfollow")){

                if(appleService.unfollowById(track_id, member.getId())){
                    out.print("done");
                }else{
                    out.print("invalid");
                }
            }
        } catch (Exception e) {
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
