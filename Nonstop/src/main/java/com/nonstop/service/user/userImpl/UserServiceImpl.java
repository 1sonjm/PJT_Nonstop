package com.nonstop.service.user.userImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;
import com.nonstop.service.user.UserDAO;
import com.nonstop.service.user.UserService;





@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		userDAO.addUser(user);
	}
	
	public void addCompany(User user) throws Exception {
		userDAO.addCompany(user);
	}

	public User getUser(String userId) throws Exception {
		return userDAO.getUser(userId);
	}

	public User getProfileUser(String careerUserId) throws Exception {
		return userDAO.getProfileUser(careerUserId);
	}

	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDAO.getUserList(search);
		int totalCount = userDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateUser(User user) throws Exception {
		userDAO.updateUser(user);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDAO.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public boolean checkUserId(String userId) throws Exception{
	      
	      boolean result = true;
	      
	      User user = userDAO.getUser(userId);
	      
	      if(user != null ) {
	         result = false;
	      }
	      return result;
	   }

	
}