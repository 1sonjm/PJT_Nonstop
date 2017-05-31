package com.nonstop.service.user;

import java.util.List;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;




public interface UserDAO {
	
	public void addUser(User user) throws Exception ;

	public void addCompany(User user) throws Exception ;

	public User getUser(String userId) throws Exception ;
	
	public User getCompany(String userId) throws Exception ;
	
	public User getProfileUser(String careerUserId) throws Exception;

	public List<User> getUserList(Search search) throws Exception ;

	public void updateUser(User user) throws Exception ;
	
	public void updateCompany(User user) throws Exception ;
	
	public int getTotalCount(Search search) throws Exception ;
	
	public void deleteUser(User user) throws Exception ;

	public List<User> getCompanyList(Search search) throws Exception;



	
}