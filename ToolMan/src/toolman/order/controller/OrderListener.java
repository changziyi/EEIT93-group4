package toolman.order.controller;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import toolman.order.model.OrderDAO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

/**
 * Application Lifecycle Listener implementation class OrderListener
 *
 */
@WebListener
public class OrderListener implements ServletContextListener{
	private  java.util.Timer  timer  =  null;  
	OrderService orderService = new OrderService();
    public OrderListener() {

    }

    public void contextInitialized(ServletContextEvent event)  { 
          
    	 
	        timer = new Timer();
	        timer.schedule(new TimerTask(){
	            public void run(){//inner class
	            	orderService.deleteExpiredOrder();
	            	orderService.updateOrderSnameToUnfinishedReviewById();
	            	orderService.updateOrderSnameToFishedById();
	            	System.out.println("");
	            }
	        }, 0, 1000l*15); // execute the task every 120 seconds for test
    }// execute the task every 2 hours
         
   
    public void contextDestroyed(ServletContextEvent event)  { 
    	if(timer!=null) timer.cancel();      
	       event.getServletContext().log("定时器销毁");
	       System.out.println("destoryed");

	            }

  }
	
//
