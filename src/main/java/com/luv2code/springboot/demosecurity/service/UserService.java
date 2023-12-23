package com.luv2code.springboot.demosecurity.service;

import com.luv2code.springboot.demosecurity.entity.User;
import com.luv2code.springboot.demosecurity.user.WebUser;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface UserService extends UserDetailsService { //public interface UserDetailsService { UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;}

	public User findByUserName(String userName);

	void save(WebUser webUser);

}
