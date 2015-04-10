package com.stat.store.controller;

import com.stat.store.entity.AppAndroid;
import com.stat.store.entity.AppIOs;
import com.stat.store.entity.User;
import com.stat.store.service.AndroidService;
import com.stat.store.service.AppleService;

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
@WebServlet(name = "AppAndroidHandler", asyncSupported = true, urlPatterns = {"/AppAndroidHandler"})
public class AppAndroidHandler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        AndroidService androidService = new AndroidService();
        try {
            out = response.getWriter();

            String action = request.getParameter("action");
            String app_id = request.getParameter("app_id");
            String package_name = request.getParameter("package_name");

            HttpSession session = request.getSession();
            User member = (User)session.getAttribute("member");

            if(action.equalsIgnoreCase("follow")){
                //search app by service
                AppAndroid app = androidService.getAppFromServiceByPackageName(package_name);
                app.setUserId(member.getId());

                if(androidService.followApp(app) != null){
                    out.print("done");
                }else{
                    out.print("invalid");
                }
            }else if(action.equalsIgnoreCase("unfollow")){

                if(androidService.unfollowAppById(app_id, member.getId())) {
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
