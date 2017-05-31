package com.nonstop.service.user.userImpl;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Search;
import com.nonstop.domain.User;
import com.nonstop.service.user.UserDAO;



@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}
	
	public void addCompany(User user) throws Exception {
		sqlSession.insert("UserMapper.addCompany", user);
	}

	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	

	public User getProfileUser(String careerUserId) throws Exception {
		return sqlSession.selectOne("UserMapper.getProfileUser",careerUserId );
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}
	
	public void updateCompany(User user) throws Exception {
		sqlSession.update("UserMapper.updateCompany", user);
	}

	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}


	public void deleteUser(User user) throws Exception {
		sqlSession.delete("UserMapper.deleteUser", user);
		
	}
	
	public User getCompany(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getCompany", userId);
	}


	@Override
	public List<User> getCompanyList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getCompanyList", search);
		
	}


	
	
	
}