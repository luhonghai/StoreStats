package com.stat.store.schedule;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static org.quartz.CronScheduleBuilder.dailyAtHourAndMinute;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

/**
 * Created by longnguyen on 4/18/15.
 */
@WebServlet(name = "JobListener", asyncSupported = true, urlPatterns = {"/JobListener"}, loadOnStartup = 1)
public class JobListener extends HttpServlet {
    Scheduler scheduler = null;

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("Start init schedule job");

        try {
            // Setup the Job class and the Job group
            JobDetail job = newJob(ReviewHistoryCron.class).withIdentity("CronQuartzJob", "Group").build();

            // Create a Trigger that fires everyday at mid-night.
            Trigger trigger = newTrigger()
                    .withIdentity("TriggerName", "Group")
                    .withSchedule(dailyAtHourAndMinute(23, 0))
                    .build();

            // Setup the Job and Trigger with Scheduler & schedule jobs
            scheduler = new StdSchedulerFactory().getScheduler();
            scheduler.start();
            scheduler.scheduleJob(job, trigger);
        }
        catch (SchedulerException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Complete init schedule job");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ReviewHistoryCron cron = new ReviewHistoryCron();
        try {
            cron.execute(null);
        } catch (JobExecutionException e) {
            e.printStackTrace();
            resp.getWriter().print("error: " + e.getMessage());
        }
        resp.getWriter().print("done");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
