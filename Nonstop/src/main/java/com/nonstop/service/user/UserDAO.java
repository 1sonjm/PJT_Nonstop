package com.nonstop.service.user;

import java.util.List;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;




public interface UserDAO {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	public void addCompany(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> getUserList(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	

	public int getTotalCount(Search search) throws Exception ;
	
}