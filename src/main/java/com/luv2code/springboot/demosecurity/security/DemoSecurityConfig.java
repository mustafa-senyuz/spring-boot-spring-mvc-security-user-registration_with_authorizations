package com.luv2code.springboot.demosecurity.security;

import com.luv2code.springboot.demosecurity.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class DemoSecurityConfig {

 
    //bcrypt bean definition	--  Spring Security 5.4.0’dan önceki bir sürüm kullanıyorsanız, bu bean tanımı gereklidir.
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    
/* 
    //authenticationProvider bean definition	--  YENİ DURUMDA KULLANIMI ŞART DEĞİL ...
    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserService userService) {
	        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
	        auth.setUserDetailsService(userService);    //set the custom user details service
	        auth.setPasswordEncoder(passwordEncoder()); //set the password encoder - bcrypt
	        return auth;
    }
*/
    
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests(configurer ->
			                        configurer
			                                .requestMatchers("/").hasRole("EMPLOYEE")
			                                .requestMatchers("/leaders/**").hasRole("MANAGER")
			                                .requestMatchers("/systems/**").hasRole("ADMIN")
			                                .requestMatchers("/register/**").permitAll()
			                                .anyRequest().authenticated()
			                				  )
             .formLogin(form ->
                        form
                                .loginPage("/showMyLoginPage")
                                .loginProcessingUrl("/authenticateTheUser")
                                .permitAll())
				                .logout(logout -> logout.permitAll())
				                .exceptionHandling(configurer ->
				                        		   configurer.accessDeniedPage("/access-denied"));

        return http.build();
    }

}