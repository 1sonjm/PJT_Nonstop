package com.nonstop.service.profile;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.Career;
import com.nonstop.domain.Follow;
import com.nonstop.domain.RecordProject;

public interface ProfileService {

	public void addCareer(Career career) throws Exception;
	
	public Map<String , Object> getCareerList(String careerUserId) throws Exception;
	
	public Map<String , Object> getCareerList2(String userId) throws Exception;
	
	public Career getCareer(int careerNo, int techClass) throws Exception;

	public void deleteCareer(int careerNo) throws Exception;
	
	public void addFollow(String reqUserId,String targetUserId) throws Exception;
	
	public List<Follow> getFollowList(String reqUserId) throws Exception;
	
	public Follow getFollow(String reqUserId ,String targetUserId) throws Exception;
	
	public void deleteFollow(String reqUserId,String targetUserId) throws Exception;
	
	public void addPortScrap(int portNo,String scrapUserId) throws Exception;
	
	public void addProjScrap(int projNo,String scrapUserId) throws Exception;
	
	public Map<String , Object> getPortScrapList(String scrapUserId) throws Exception;
	
	public void deleteJsonPortScrap(int portNo , String scrapUserId) throws Exception;
	
	public void deleteJsonProjScrap(int projNo , String scrapUserId) throws Exception;
	
	public List<RecordProject> getRecordProjectList(String recUserId) throws Exception;
	
	public List<RecordProject> getRecordProjectList2(String comId) throws Exception;

}
