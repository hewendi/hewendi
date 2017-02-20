package com.anyofficeanywhere.testportal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath:spring-activiti.xml"}) 
@EnableTransactionManagement 
@Transactional 
public class home extends AbstractTransactionalJUnit4SpringContextTests{
    @Test  
    public void test(){
    	/* 
    	 * Activiti入门篇--Spring 与Activiti的入门整合  http://www.iteye.com/topic/1134046
    	 * Activiti数据库表结构(表详细版) http://blog.csdn.net/hj7jay/article/details/51302829
    	 *  */
        System.out.println ("test");   
    }  
      
}  
