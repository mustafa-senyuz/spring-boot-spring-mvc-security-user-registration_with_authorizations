package com.luv2code.springboot.demosecurity.service;

import com.luv2code.springboot.demosecurity.dao.RoleDao;
import com.luv2code.springboot.demosecurity.dao.UserDao;
import com.luv2code.springboot.demosecurity.entity.Role;
import com.luv2code.springboot.demosecurity.entity.User;
import com.luv2code.springboot.demosecurity.user.WebUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDao;

	private RoleDao roleDao;
	
	private String role_id ;

	private BCryptPasswordEncoder passwordEncoder; 

	@Autowired
	public UserServiceImpl(UserDao userDao, RoleDao roleDao, BCryptPasswordEncoder passwordEncoder) {
		this.userDao = userDao;
		this.roleDao = roleDao;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public User findByUserName(String userName) {
		// check the database if the user already exists
		return userDao.findByUserName(userName);
	}

	@Override
	public void save(WebUser webUser) {
		
		User user = new User();

		// assign user details to the user object
		user.setUserName(webUser.getUserName());
		user.setPassword(passwordEncoder.encode(webUser.getPassword()));
		user.setFirstName(webUser.getFirstName());
		user.setLastName(webUser.getLastName());
		user.setEmail(webUser.getEmail());
		
 		System.out.println("------------------------------------------------------------------------------");
 		Collection<Role> role =  webUser.getAuthority();
 		for (Role r : role) {
 			  role_id = r.getName();
 			}
 		
		System.out.println(role_id); 			// 3 -  2  - 1
		int roleID = Integer.parseInt(role_id); // x = "3 -  2  - 1"
		Role roleNO = roleDao.findRoleBYid(roleID);	// role nesnesini id ye göre bul
		
		// roleID değerine göre user'a farklı roller atayalım
		switch(roleID) {
		  case 1:
		    // roleID 1 ise, user'a sadece 1 id'li rolü atayalım
		    user.setRoles(Arrays.asList(roleNO));
		    break;
		  case 2:
		    // roleID 2 ise, user'a hem 1 hem 2 id'li rolleri atayalım
		    user.setRoles(Arrays.asList(roleNO, roleDao.findRoleBYid(1)));
		    break;
		  case 3:
		    // roleID 3 ise, user'a 1, 2, 3 id'li rolleri atayalım
		    user.setRoles(Arrays.asList(roleNO, roleDao.findRoleBYid(1), roleDao.findRoleBYid(2)));
		    break;
		  default:
		    // roleID geçersiz ise, user'a hiçbir rol atamayalım
		    user.setRoles(new ArrayList<>());
		    break;
		}
				
		//user.setRoles(Arrays.asList(roleNO));
 		System.out.println("------------------------------------------------------------------------------");
		
 		/*
		//if wanted ; you can give user default role of "employee"
	     user.setRoles(Arrays.asList(roleDao.findRoleByName("ROLE_EMPLOYEE")));
		 System.out.println("ROLE NESNESİ		:   " + roleDao.findRoleByName("ROLE_EMPLOYEE"));	//ROLE NESNESİ		:   Role{id=1, name='ROLE_EMPLOYEE'}
		*/
 		
 		
		// save user in the database
		userDao.save(user);
	}

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {		//DB den User i çekiyor
				
		User user = userDao.findByUserName(userName);

		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}

		Collection<SimpleGrantedAuthority> authorities = mapRolesToAuthorities(user.getRoles());

		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),  authorities);
	}

	
	
	private Collection<SimpleGrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
		
			Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();

		for (Role tempRole : roles) {
			SimpleGrantedAuthority tempAuthority = new SimpleGrantedAuthority(tempRole.getName());
			authorities.add(tempAuthority);	//gather all authories
		}

		return authorities;
	}
}
