package com.nonstop.service.profile;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.Career;
import com.nonstop.domain.Follow;
import com.nonstop.domain.Scrap;

public interface ProfileService {
	

	public void addCareer(Career career) throws Exception;
	
	public Map<String , Object> getCareerList(String careerUserId) throws Exception;
	
	public void updateCareer(Career career , String careerUserId) throws Exception;
	
	public void deleteCareer(int careerNo) throws Exception;
	
	public void addFollow(String reqUserId,String targetUserId) throws Exception;
	
	public List<Follow> getFollowList(String reqUserId) throws Exception;
	
	public void deleteFollow(String reqUserId,String targetUserId) throws Exception;
	
	public void addPortScrap(int portNo ,String scrapUserId) throws Exception;
	
	public void addProjScrap(int projNo ,String scrapUserId) throws Exception;
	
	public List<Scrap> getScrapList(int scrapDiv , String scrapUserId , int postNo) throws Exception;
	
	public void deleteScrap(String scrapUserId , int postNo , int scrapDiv) throws Exception;

}
