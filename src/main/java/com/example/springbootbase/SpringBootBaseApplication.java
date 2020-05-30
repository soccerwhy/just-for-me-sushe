package com.example.springbootbase;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.SQLException;

@SpringBootApplication
public class SpringBootBaseApplication {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		SpringApplication.run(SpringBootBaseApplication.class, args);

	}
}

