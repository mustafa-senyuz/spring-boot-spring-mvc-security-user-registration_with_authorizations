package com.luv2code.springboot.demosecurity.dao;

import com.luv2code.springboot.demosecurity.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
	public Role findRoleBYid(int role_id);
	
    public void deleteRoleBYid(int id);
	
}
