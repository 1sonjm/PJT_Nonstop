package com.nonstop.service.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public void addCompany(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;

	public User getCompany(String userId) throws Exception;

	public User getProfileUser(String careerUserId) throws Exception;

	public User getProfileMine(String careerUserId) throws Exception;
	
	public User getProfileOther(String userId) throws Exception;

	public Map<String , Object> getUserList(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updateCompany(User user) throws Exception;
	
	public User checkUserId(String userId) throws Exception;

	public boolean checkId(String userId) throws Exception;
	
	public boolean checkRole(String role) throws Exception;
	
	public void deleteUser(User user) throws Exception;

	public Map<String, Object> getCompanyList(Search search) throws Exception;





	
	


	
}