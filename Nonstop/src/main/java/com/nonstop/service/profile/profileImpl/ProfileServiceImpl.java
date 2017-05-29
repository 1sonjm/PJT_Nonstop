package com.nonstop.service.profile.profileImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Career;
import com.nonstop.domain.Follow;
import com.nonstop.domain.Scrap;
import com.nonstop.service.profile.ProfileDAO;
import com.nonstop.service.profile.ProfileService;

@Service("profileServiceImpl")
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	@Qualifier("profileDAOImpl")
	private ProfileDAO profileDAO;
	public void setProfileDAO(ProfileDAO profileDAO){
		this.profileDAO = profileDAO;
	}
	public ProfileServiceImpl(){
		System.out.println(this.getClass());
	}

	public void addCareer(Career career) throws Exception {
		profileDAO.addCareer(career);
		
	}
	public Map<String , Object> getCareerList(String careerUserId) throws Exception {
		
		return profileDAO.getCareerList(careerUserId);
	}
	
	public Map<String , Object> getCareerList2(String userId) throws Exception {
		
		return profileDAO.getCareerList(userId);
	}

	public Career getCareer(int careerNo) throws Exception {
		return profileDAO.getCareer(careerNo);
	}

	public void updateCareer(Career career) throws Exception {
		profileDAO.updateCareer(career);
		
	}

	public void deleteCareer(int careerNo) throws Exception {
		profileDAO.deleteCareer(careerNo);
	}

	public void addFollow(String reqUserId, String targetUserId) throws Exception {
		profileDAO.addFollow(reqUserId, targetUserId);
	}
	
	public List<Follow> getFollowList(String reqUserId) throws Exception {
	
		return profileDAO.getFollowList(reqUserId);
	}

	public Follow getFollow(String reqUserId) throws Exception {
		return profileDAO.getFollow(reqUserId);
	}
	
	public void deleteFollow(String reqUserId, String targetUserId) throws Exception {
		profileDAO.deleteFollow(reqUserId, targetUserId);
	}
	
	public void addPortScrap(int portNo, String scrapUserId) throws Exception {
		profileDAO.addPortScrap(portNo,scrapUserId);
	}
	
	public void addProjScrap(int projNo, String scrapUserId) throws Exception {
		profileDAO.addProjScrap(projNo, scrapUserId);
	}
	
	public List<Scrap> getScrapList(int scrapDiv, String scrapUserId, int postNo) throws Exception {
		
		List<Scrap> list = profileDAO.getScrapList(scrapDiv, scrapUserId, postNo);
		
		return list;
	}

	public Map<String, Object> getPortScrapList(String scrapUserId) throws Exception {
		
		return profileDAO.getPortScrapList(scrapUserId);
	}

	public void deleteJsonPortScrap(int portNo, String scrapUserId) throws Exception {
		profileDAO.deleteJsonPortScrap(portNo,scrapUserId );
	}

	public Map<String , Object> getRecordProjectList(String recUserId) throws Exception{
		
		return profileDAO.getRecordProjectList(recUserId);
	}
	
	
}
