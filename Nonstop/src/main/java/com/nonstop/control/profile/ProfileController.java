package com.nonstop.control.profile;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.Career;
import com.nonstop.domain.Follow;
import com.nonstop.domain.Portfolio;
import com.nonstop.domain.Project;
import com.nonstop.domain.RecordProject;
import com.nonstop.domain.Search;
import com.nonstop.domain.Statistics;
import com.nonstop.domain.User;
import com.nonstop.service.portfolio.PortfolioService;
import com.nonstop.service.profile.ProfileService;
import com.nonstop.service.project.ProjectService;
import com.nonstop.service.statistics.StatisticsService;
import com.nonstop.service.user.UserService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	@Autowired
	@Qualifier("projectServiceImpl")
	private ProjectService projectService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("portfolioServiceImpl")
	private PortfolioService portfolioService;
	
	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;
	
	public ProfileController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="getMineProfile",method=RequestMethod.GET)
	public String getMineProfile(@RequestParam("role") String role, Model model , HttpSession session) throws Exception{
		
		System.out.println("/profile/getMineProfile");
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		//프로필 개인정보 
		User user = userService.getProfileMine(sessionId);
		//개인기술경력 리스트 
		Map<String , Object> map = profileService.getCareerList(sessionId);
		
		if(role.equals("2")){
		//프로젝트 작업이력 
		List<RecordProject> recordProject = profileService.getRecordProjectList(sessionId);
		//프로젝트 작업이력 리스트
		model.addAttribute("recordProject"  , recordProject);
		}else if(role.equals("3")){
		List<RecordProject> recordProject = profileService.getRecordProjectList2(sessionId);
		model.addAttribute("recordProject"  , recordProject);
		}
		//포트폴리오 리스트
		List<Portfolio> portfolio = portfolioService.getProfilePortList(sessionId, sessionId);
		//스크랩한 포트폴리오 리스트
		List<Portfolio> scrapPort = portfolioService.getProfilePortScrapList(sessionId, sessionId);
		//프로젝트 리스트
		List<Project> project = projectService.getProfileProjList(sessionId, sessionId);
		//스크랩한 프로젝트 리스트
		List<Project> scrapProj = projectService.getProfileScrapProjList(sessionId, sessionId);
		//팔로우리스트
		List<Follow> follow = profileService.getFollowList(sessionId);
		//기술분류 데이터 리스트
		List<Statistics> techClassList = statisticsService.getTechClassList();
		
		int classNo = 1;
		//기술 데이터리스트
		List<Statistics> techDataList = statisticsService.getTechDataList(classNo);
		
		//개인기술경력 리스트
		model.addAttribute("list" , map.get("list"));
		
		model.addAttribute("list3" , portfolio);
		model.addAttribute("scrapPort" , scrapPort);
		model.addAttribute("scrapProj" , scrapProj);
		model.addAttribute("list4" , project);
		model.addAttribute("user", user);
		model.addAttribute("follow", follow);
		model.addAttribute("techClassList" , techClassList);
		model.addAttribute("techDataList" , techDataList);
		
		
		return "forward:/view/profile/profile.jsp";
	}
	
	@RequestMapping(value="getOtherProfile",method=RequestMethod.GET)
	public String getOtherProfile(@RequestParam("userId") String userId, HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/getOtherProfile");
		//프로필 기본정보
		User user = userService.getProfileOther(userId);
		
		Map<String , Object> map = profileService.getCareerList(userId);
		
		System.out.println(user.getRole());
		if(user.getRole().equals("2")){
			
		List<RecordProject> recordProject = profileService.getRecordProjectList(userId);
		model.addAttribute("recordProject"  , recordProject);
		}else if(user.getRole().equals("3")){
			
		List<RecordProject> recordProject = profileService.getRecordProjectList2(userId);
		model.addAttribute("recordProject"  , recordProject);
		}
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		String targetUserId = userId;
		
		Follow follow = profileService.getFollow(sessionId , targetUserId);
		
		List<Portfolio> portfolio = portfolioService.getProfilePortList(sessionId, userId);

		List<Project> project = projectService.getProfileProjList(sessionId, userId);
		
		//개인기술경력 리스트
		model.addAttribute("list" , map.get("list"));
		//프로젝트 작업이력 리스트
		///model.addAttribute("list2"  ,map2.get("list2"));
		model.addAttribute("user", user);
		model.addAttribute("follow", follow);
		model.addAttribute("list3", portfolio);
		model.addAttribute("list4", project);
		
		
		return "forward:/view/profile/profile.jsp";
	}

	@RequestMapping(value="addCareer",method=RequestMethod.POST)
	public String addCareer(@ModelAttribute("career") Career career , HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/addCareer : POST");
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		career.setCareerUserId(sessionId);
		career.setTechClass(1);
		career.setTechNo(1000);
		profileService.addCareer(career);
		
		User user = userService.getProfileMine(sessionId);
		//개인기술경력 리스트 
		Map<String , Object> map = profileService.getCareerList(sessionId);
		//프로젝트 작업이력 
		///Map<String , Object> map2 = profileService.getRecordProjectList(sessionId);
		//포트폴리오 리스트
		List<Portfolio> portfolio = portfolioService.getProfilePortList(sessionId, sessionId);
		//스크랩한 포트폴리오 리스트
		List<Portfolio> scrapPort = portfolioService.getProfilePortScrapList(sessionId, sessionId);
		//프로젝트 리스트
		List<Project> project = projectService.getProfileProjList(sessionId, sessionId);
		//스크랩한 프로젝트 리스트
		List<Project> scrapProj = projectService.getProfileScrapProjList(sessionId, sessionId);
		//팔로우리스트
		List<Follow> follow = profileService.getFollowList(sessionId);
		//기술분류 데이터 리스트
		List<Statistics> techClassList = statisticsService.getTechClassList();
		
		int classNo = 1;
		//기술 데이터리스트
		List<Statistics> techDataList = statisticsService.getTechDataList(classNo);
		
		//개인기술경력 리스트
		model.addAttribute("list" , map.get("list"));
		//프로젝트 작업이력 리스트
		///model.addAttribute("list2"  ,map2.get("list2"));
		model.addAttribute("list3" , portfolio);
		model.addAttribute("scrapPort" , scrapPort);
		model.addAttribute("scrapProj" , scrapProj);
		model.addAttribute("list4" , project);
		model.addAttribute("user", user);
		model.addAttribute("follow", follow);
		model.addAttribute("techClassList" , techClassList);
		model.addAttribute("techDataList" , techDataList);
		
		return "forward:/view/profile/profile.jsp";
		
	}

	@RequestMapping(value="deleteCareer",method=RequestMethod.GET)
	public String deleteCareer(@RequestParam("careerNo") int careerNo , HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/deleteCareer : GET");
		
		profileService.deleteCareer(careerNo);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		User user = userService.getProfileMine(sessionId);
		
		Map<String , Object> map = profileService.getCareerList(sessionId);

		//Map<String , Object> map2 = profileService.getRecordProjectList(sessionId);
		
		List<Portfolio> portfolio = portfolioService.getProfilePortList(sessionId, sessionId);
		
		List<Portfolio> scrapPort = portfolioService.getProfilePortScrapList(sessionId, sessionId);

		List<Project> project = projectService.getProfileProjList(sessionId, sessionId);
		
		List<Project> scrapProj = projectService.getProfileScrapProjList(sessionId, sessionId);
		
		List<Statistics> techClassList = statisticsService.getTechClassList();
		
		int classNo = 1;
		
		List<Statistics> techDataList = statisticsService.getTechDataList(classNo);
		
		List<Follow> follow = profileService.getFollowList(sessionId);
		
		model.addAttribute("techClassList" , techClassList);
		model.addAttribute("techDataList" , techDataList);
		model.addAttribute("list" , map.get("list"));
		///model.addAttribute("list2"  ,map2.get("list2"));
		model.addAttribute("list3" , portfolio);
		model.addAttribute("list4" , project);
		model.addAttribute("user", user);
		model.addAttribute("scrapPort", scrapPort);
		model.addAttribute("scrapProj", scrapProj);
		model.addAttribute("follow", follow);
		
		return "forward:/view/profile/profile.jsp";
	}
	

	@RequestMapping(value="addJsonFollow/{targetUserId}",method=RequestMethod.GET)
	public void addJsonFollow(@PathVariable String targetUserId ,HttpSession session) throws Exception{
		
		System.out.println("/profile/addJsonFollow : GET");
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		
		System.out.println(reqUserId+targetUserId);
		profileService.addFollow(reqUserId, targetUserId);
		
	}

	@RequestMapping(value="deleteJsonFollow/{targetUserId}",method=RequestMethod.GET)
	public void deleteJsonFollow(@PathVariable String targetUserId , HttpSession session) throws Exception{
		
		System.out.println("/profile/deleteJsonFollow : POST");
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.deleteFollow(reqUserId, targetUserId);
	}
	
	@RequestMapping(value="addJsonPortScrap/{portNo}" , method=RequestMethod.GET)
	public void addJsonPortScrap(@PathVariable int portNo, HttpSession session ) throws Exception{
		
		System.out.println("/profile/addPortScrap");
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.addPortScrap(portNo ,scrapUserId);
	}
	
	@RequestMapping(value="addJsonProjScrap/{projNo}" , method=RequestMethod.GET)
	public void addJsonProjScrap(@PathVariable int projNo, HttpSession session ) throws Exception{
		
		System.out.println("/profile/addProjNoScrap");
	
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.addProjScrap(projNo,scrapUserId);
	}

	@RequestMapping(value="deleteJsonPortScrap/{portNo}",method=RequestMethod.GET)
	public void deleteJsonPortScrap(@PathVariable int portNo , HttpSession session , Model model) throws Exception{
		
		System.out.println("/profile/deleteScrap : GET");
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.deleteJsonPortScrap(portNo , scrapUserId);
	}
	
	@RequestMapping(value="deleteJsonProjScrap/{projNo}",method=RequestMethod.GET)
	public void deleteJsonProjScrap(@PathVariable int projNo , HttpSession session , Model model) throws Exception{
		
		System.out.println("/profile/deleteProjScrap : GET");
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.deleteJsonProjScrap(projNo , scrapUserId);
	}
	
}
