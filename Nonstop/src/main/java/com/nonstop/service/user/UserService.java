package com.nonstop.service.user;

import java.util.Map;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;





public interface UserService {
	

	public void addUser(User user) throws Exception;
	
	public void addCompany(User user) throws Exception;
	
	
	public User getUser(String userId) throws Exception;
	
	public User getProfileUser(String careerUserId) throws Exception;
	
	public Map<String , Object> getUserList(Search search) throws Exception;
	

	public void updateUser(User user) throws Exception;
	

	public boolean checkDuplication(String userId) throws Exception;
	
	public boolean checkUserId(String userId) throws Exception;
	
}