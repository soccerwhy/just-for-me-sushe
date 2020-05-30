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

	}
}

