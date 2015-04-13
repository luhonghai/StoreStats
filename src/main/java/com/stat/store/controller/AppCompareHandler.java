package com.stat.store.controller;

import com.google.gson.Gson;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by longnguyen on 4/13/15.
 */
@WebServlet(name = "AppCompareHandler", asyncSupported = true, urlPatterns = {"/AppCompareHandler"})
public class AppCompareHandler extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        Gson gson = new Gson();
        AppleService appleService = new AppleService();
        AndroidService androidService = new AndroidService();
        try {
            out = response.getWriter();

            String action = request.getParameter("action");


            if(action.equalsIgnoreCase("compareIOS")){
                String my_app = request.getParameter("my_app");
                String competitor = request.getParameter("competitor");

                //search app by service
                AppIOs myApp = appleService.getAppDetail(my_app);
                AppIOs myCompetitor = appleService.getAppDetail(competitor);

                List<AppIOs> list = new ArrayList<AppIOs>();
                list.add(myApp);
                list.add(myCompetitor);

                if(list != null && list.size() > 0){
                    out.print(gson.toJson(list));
                }else{
                    out.print("invalid");
                }
            }else if(action.equalsIgnoreCase("compareAndroid")){
                //package name
                String my_app = request.getParameter("my_app");
                String competitor = request.getParameter("competitor");

                //search app by service
                AppAndroid myApp = androidService.getAppFromServiceByPackageName(my_app);
                AppAndroid myCompetitor = androidService.getAppFromServiceByPackageName(competitor);

                List<AppAndroid> list = new ArrayList<AppAndroid>();
                list.add(myApp);
                list.add(myCompetitor);

                if(list != null && list.size() > 0){
                    out.print(gson.toJson(list));
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
