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
      int result  = adminDao.todayLoginCount();
      
      if(result > 0) {
    	  adminDao.todayLoginReset();
    	  //회원이 자정일떄도 현재 로그인이 되어 있다면 todayLogin Y
      }
    }
}
