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
import com.nonstop.domain.RecordApplicant;
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

		map.put("list", list);
		return map;
	}
	
	public Map<String , Object> getCareerList2(String userId) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		List<Career> list = sqlSession.selectList("CareerMapper.getListCareer",userId);

		map.put("list", list);
		return map;
	}

	public Career getCareer(int careerNo) throws Exception {
		return sqlSession.selectOne("CareerMapper.getCareer", careerNo);
	}
	
	public void updateCareer(Career career) throws Exception {
		
		sqlSession.update("CareerMapper.updateCareer",career);
	}
	
	public void deleteCareer(int careerNo) throws Exception {
		sqlSession.delete("CareerMapper.deleteCareer",careerNo);
	}

	public void addFollow(String reqUserId, String targetUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("reqUserId", reqUserId);
		map.put("targetUserId", targetUserId);
		
		sqlSession.insert("FollowMapper.addFollow",map);
	}

	public List<Follow> getFollowList(String reqUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("reqUserId", reqUserId);
		
		return sqlSession.selectList("FollowMapper.getListFollow",map);
	}

	public Follow getFollow(String reqUserId) throws Exception {
		return sqlSession.selectOne("FollowMapper.getFollow", reqUserId);
	}

	
	public void deleteFollow(String reqUserId, String targetUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("reqUserId",reqUserId);
		map.put("targetUserId", targetUserId);
		
		sqlSession.delete("FollowMapper.deleteFollow",map);
	}

	public void addPortScrap(int portNo,String scrapUserId) throws Exception {

		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("portNo", portNo);
		map.put("scrapUserId", scrapUserId);
		
		
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

	public Map<String, Object> getRecordProjectList(String recUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<RecordApplicant> list = sqlSession.selectList("RecordProjectMapper.getListRecordProject", recUserId);
		
		map.put("list", list);
		
		return map;
	}

}









