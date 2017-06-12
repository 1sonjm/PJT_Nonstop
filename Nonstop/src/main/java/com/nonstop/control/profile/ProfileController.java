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
	public String getMineProfile( Model model , HttpSession session) throws Exception{
		
		System.out.println("/profile/getMineProfile");
		
		String careerUserId = ((User)session.getAttribute("user")).getUserId();
		
		User user = userService.getProfileMine(careerUserId);
		
		System.out.println("/profile/getMineProfile in getCareerList");
		
		Map<String , Object> map = profileService.getCareerList(careerUserId);
		
		String recUserId = ((User)session.getAttribute("user")).getUserId();
		
		Map<String , Object> map2 = profileService.getRecordProjectList(recUserId);

		String scrapUserId=((User)session.getAttribute("user")).getUserId();
		
		Search search = new Search();
		search.setPostDivision(1);
		search.setStartRowNum(1);
		search.setEndRowNum(120);
		List<Portfolio> portfolio = portfolioService.getPortfolioList(search, scrapUserId);
		
		search.setPostDivision(2);
		
		List<Portfolio> portfolio2 = portfolioService.getPortfolioList(search, scrapUserId);
		
		int projDivision = 1;
		
		int sortFlag=0;
		
		Search search2 = new Search();
		
		List<Project> project = projectService.listProject(projDivision, scrapUserId, search2, sortFlag);
		
		projDivision = 2;
		
		List<Project> project2 = projectService.listProject(projDivision, scrapUserId, search2, sortFlag);
		
		String reqUserId = scrapUserId;
		
		List<Follow> follow = profileService.getFollowList(reqUserId);
		
		List<Statistics> techClassList = statisticsService.getTechClassList();
		
		int classNo = 1;
		
		List<Statistics> techDataList = statisticsService.getTechDataList(classNo);
		
		model.addAttribute("techClassList" , techClassList);
		model.addAttribute("techDataList" , techDataList);
		model.addAttribute("list" , map.get("list"));
		model.addAttribute("list2"  ,map2.get("list2"));
		model.addAttribute("list3" , portfolio);
		model.addAttribute("list5" , portfolio2);
		model.addAttribute("list4" , project);
		model.addAttribute("list6" , project2);
		model.addAttribute("user", user);
		model.addAttribute("follow", follow);
		
		return "forward:/view/profile/profile.jsp";
	}
	
	@RequestMapping(value="getOtherProfile",method=RequestMethod.GET)
	public String getOtherProfile(@RequestParam("userId") String userId, HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/getOtherProfile");
		
		User user = userService.getProfileOther(userId);
		
		System.out.println("/profile/getOtherProfile in getCareerList");
		
		Map<String , Object> map = profileService.getCareerList(userId);
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("/profile/getOtherProfile in getFollow");
		
		String targetUserId = userId;
		
		Follow follow = profileService.getFollow(reqUserId , targetUserId);
		
		Search search = new Search();
		search.setPostDivision(1);
		search.setStartRowNum(1);
		search.setEndRowNum(16);
		String scrapUserId = reqUserId;
		List<Portfolio> portfolio = portfolioService.getPortfolioList(search, scrapUserId);
			
		search.setPostDivision(2);
		List<Portfolio> portfolio2 = portfolioService.getPortfolioList(search, scrapUserId);
		model.addAttribute("list3", portfolio);
		model.addAttribute("list5", portfolio2);
			
		Search search2 = new Search();
			
		int projDivision = 1;
		int sortFlag=0;
		
		List<Project> project = projectService.listProject(projDivision, scrapUserId, search2, sortFlag);
			
		projDivision = 2;
			
		List<Project> project2 = projectService.listProject(projDivision, scrapUserId, search2, sortFlag);
		model.addAttribute("list4", project);
		model.addAttribute("list6", project2);
		model.addAttribute("list" , map.get("list"));
		model.addAttribute("user", user);
		model.addAttribute("follow", follow);
		
		
		return "forward:/view/profile/profile.jsp";
	}

	@RequestMapping(value="addCareer",method=RequestMethod.POST)
	public String addCareer(@ModelAttribute("career") Career career , HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/addCareer : POST");
		
		String careerUserId = ((User)session.getAttribute("user")).getUserId();
		
		career.setCareerUserId(careerUserId);
		
		profileService.addCareer(career);
		
		Map<String , Object> map = profileService.getCareerList(careerUserId);
		
		model.addAttribute("list" , map.get("list"));
		
		return "forward:/view/profile/profile.jsp";
		
	}
	
	@RequestMapping(value="getCareerList")
	public String getCareerList(@RequestParam("careerUserId")String careerUserId , Model model) throws Exception{
		
		System.out.println("/profile/getCareerList");
		
		Map<String , Object> map = profileService.getCareerList(careerUserId);
		
		model.addAttribute("list" , map.get("list"));
		
		return "forward:/view/profile/listCareer.jsp";
		
	}
	
	@RequestMapping(value="deleteCareer",method=RequestMethod.GET)
	public String deleteCareer(@RequestParam("careerNo") int careerNo , HttpSession session, Model model) throws Exception{
		
		System.out.println("/profile/deleteCareer : GET");
		
		profileService.deleteCareer(careerNo);
		
		String careerUserId = ((User)session.getAttribute("user")).getUserId();
		
		User user = userService.getProfileMine(careerUserId);
		
		Map<String , Object> map = profileService.getCareerList(careerUserId);
		
		String recUserId = ((User)session.getAttribute("user")).getUserId();
		
		Map<String , Object> map2 = profileService.getRecordProjectList(recUserId);
		
		String scrapUserId=((User)session.getAttribute("user")).getUserId();
		
		Search search = new Search();
		
		search.setPostDivision(1);
		
		List<Portfolio> portfolio = portfolioService.getPortfolioList(search, scrapUserId);
		
		Search search2 = new Search();
		
		int projDivision = 1;
		int sortFlag=0;
		
		List<Project> project = projectService.listProject(projDivision, scrapUserId, search2, sortFlag);
		
		model.addAttribute("list" , map.get("list"));
		model.addAttribute("list2"  ,map2.get("list2"));
		model.addAttribute("list3" , portfolio);
		model.addAttribute("list4" , project);
		model.addAttribute("user", user);
		
		return "forward:/view/profile/profile.jsp";
	}
	
	@RequestMapping(value="addFollow",method=RequestMethod.GET)
	public void addFollow(@RequestParam("targetUserId") String targetUserId ,HttpSession session) throws Exception{
		
		System.out.println("/profile/addFollow : GET");
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		
		System.out.println(reqUserId+targetUserId);
		profileService.addFollow(reqUserId, targetUserId);
	}
	
	@RequestMapping(value="addJsonFollow/{targetUserId}",method=RequestMethod.GET)
	public void addJsonFollow(@PathVariable String targetUserId ,HttpSession session) throws Exception{
		
		System.out.println("/profile/addJsonFollow : GET");
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		
		System.out.println(reqUserId+targetUserId);
		profileService.addFollow(reqUserId, targetUserId);
		
	}
	
	@RequestMapping(value="getFollowList")
	public String getFollowList(@RequestParam("reqUserId") String reqUserId , Model model) throws Exception{
		
		System.out.println("/profile/getFollowList");
		
		System.out.println(reqUserId);
		
		List<Follow> list = profileService.getFollowList(reqUserId);

		model.addAttribute("list",list);
		
		return "forward:/view/profile/listFollow.jsp";
	}
	
	@RequestMapping(value="deleteJsonFollow/{targetUserId}",method=RequestMethod.GET)
	public void deleteJsonFollow(@PathVariable String targetUserId , HttpSession session) throws Exception{
		
		System.out.println("/profile/deleteJsonFollow : POST");
		
		String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		profileService.deleteFollow(reqUserId, targetUserId);
	}
	
	@RequestMapping(value="deleteFollow/{teargetUserId}",method=RequestMethod.GET)
	public void deleteFollow(@RequestParam("targetUserId") String targetUserId , HttpSession session) throws Exception{
		
		System.out.println("/profile/deleteFollow : POST");
		
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
	
	@RequestMapping(value="getPortScrapList" , method=RequestMethod.GET)
	public String getPortScrapList(HttpSession session, Model model) throws Exception{
		System.out.println("getPortScrapList : GET");
		
		String scrapUserId=((User)session.getAttribute("user")).getUserId();
		
		Search search = new Search();
		
		search.setPostDivision(1);
		
		List<Portfolio> portfolio = portfolioService.getPortfolioList(search, scrapUserId);
		
		model.addAttribute("list" , portfolio);
		
		return "forward:/view/profile/listPortScrap";
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
