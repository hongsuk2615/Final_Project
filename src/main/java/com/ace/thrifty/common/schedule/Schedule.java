package com.ace.thrifty.common.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ace.thrifty.admin.model.dao.AdminDao;

@Component
public class Schedule {
	
	@Autowired
	private AdminDao adminDao;
	
    @Scheduled(cron="0 0 0 * * *")
    public void todayLoginCount() {
    	System.out.println("cronTest");
      int result  = adminDao.todayLoginCount();
      
      if(result > 0) {
    	  adminDao.todayLoginReset();
      }
    }
}
