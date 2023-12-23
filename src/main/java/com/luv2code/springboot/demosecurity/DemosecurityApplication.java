package com.luv2code.springboot.demosecurity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.SpringSecurityCoreVersion;

@SpringBootApplication
public class DemosecurityApplication {

	public static void main(String[] args) {
		System.out.println("Spring Security version: " + SpringSecurityCoreVersion.getVersion());
		SpringApplication.run(DemosecurityApplication.class, args);
	}

}
																											
