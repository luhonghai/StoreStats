package com.stat.store.schedule;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import static org.quartz.CronScheduleBuilder.dailyAtHourAndMinute;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

/**
 * Created by longnguyen on 4/18/15.
 */
public class JobListener implements ServletContextListener {
    Scheduler scheduler = null;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Context Initialized");

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
            scheduler.scheduleJob(job, trigger);
            scheduler.start();
        }
        catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    /**
     * Receives notification that the ServletContext is about to be
     * shut down.
     * <p/>
     * <p>All servlets and filters will have been destroyed before any
     * ServletContextListeners are notified of context
     * destruction.
     *
     * @param sce the ServletContextEvent containing the ServletContext
     *            that is being destroyed
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
