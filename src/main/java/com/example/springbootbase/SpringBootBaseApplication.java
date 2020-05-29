package com.example.springbootbase;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Logger;

@SpringBootApplication
public class SpringBootBaseApplication {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		SpringApplication.run(SpringBootBaseApplication.class, args);
//
//		//1.注册驱动
//		Class.forName("com.mysql.jdbc.Driver");
//		//2.获取连接
//		String url="jdbc:mysql://localhost:3306/volunteer_system";
//		String username="root";
//		String password="iloveluo1";
//		Connection conn= DriverManager.getConnection(url,username,password);
//		//3.创建方法执行对象
//		Statement stat=conn.createStatement();
//
//
//		String user="aaa";
//
//		String pwd="bbb";
//
//		//执行SQL语句，数据表，查询用户名和密码，如果存在，登陆成功，不存在登陆失败
//		String sql="select * from Person where username='"+user+"' and password='"+pwd+"' or 1="+1+"";
//		System.out.println(sql);
//		ResultSet rs=stat.executeQuery(sql);
//		while(rs.next()){
//			System.out.println(rs.getString("username")+"  "+rs.getString("password"));
//		}
//		rs.close();
//		stat.close();
//		conn.close();
//	}
//


	}
}

