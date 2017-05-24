package com.nonstop.service.profile.profileImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Career;
import com.nonstop.domain.Follow;
import com.nonstop.domain.Scrap;
import com.nonstop.service.profile.ProfileDAO;

@Repository("profileDAOImpl")
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public ProfileDAOImpl(){
		System.out.println(this.getClass());
	}

	public void addCareer(Career career) throws Exception {
		sqlSession.insert("CareerMapper.addCareer",career);
	}
	
	public Map<String , Object> getCareerList(String careerUserId) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		List<Career> list = sqlSession.selectList("CareerMapper.getListCareer",careerUserId);
		System.out.println("+++++"+list);
		map.put("list", list);
		return map;
	}
	
	public void updateCareer(Career career,String careerUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("career", career);
		map.put("careerUserId", careerUserId);
		
		sqlSession.update("CareerMapper.updateCareer",map);
	}

	public void deleteCareer(int careerNo) throws Exception {
		sqlSession.delete("CareerMapper.deleteCareer",careerNo);
	}

	public void addFollow(String reqUserId, String targetUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("reqUserId", reqUserId);
		map.put("targetUserId", targetUserId);
		
		sqlSession.insert("FollowMapper.addCareer",map);
	}

	public List<Follow> getFollowList(String reqUserId) throws Exception {
		
		return sqlSession.selectList("FollowMapper.getListFollw",reqUserId);
	}
	
	public void deleteFollow(String reqUserId, String targetUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("reqUserId",reqUserId);
		map.put("targetUserId", targetUserId);
		
		sqlSession.delete("FollowMapper.deleteFollow",map);
	}

	public void addPortScrap(int portNo, String scrapUserId) throws Exception {

		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("scrapUserId", scrapUserId);
		map.put("portNo", portNo);
		
		sqlSession.insert("ScrapMapper.addPortScrap",map);
	}
		
	public void addProjScrap(int projNo ,String scrapUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("postNo", projNo);
		map.put("scrapUserId", scrapUserId);
		
		
		sqlSession.insert("ScrapMapper.addProjScrap",map);
	}

	public List<Scrap> getScrapList(int scrapDiv, String scrapUserId, int postNo) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		
		map.put("scrapUserId", scrapUserId);
		map.put("postNo", postNo);
		map.put("scrapDiv",scrapDiv);
	
		return sqlSession.selectList("ScrapMapper.getListScrap" , map);
	}


	public void deleteScrap(String scrapUserId, int postNo , int scrapDiv) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("scrapUserId", scrapUserId);
		map.put("scrapNo", postNo);
		map.put("scrapDiv", scrapDiv);
		
		sqlSession.delete("ScrapMapper.deleteScrap", map);
		
	}

	

	
	


	
	
	

	

}









