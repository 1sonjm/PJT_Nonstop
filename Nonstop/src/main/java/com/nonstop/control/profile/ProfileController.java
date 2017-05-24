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
import com.nonstop.service.profile.ProfileService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	public ProfileController(){
		System.out.println(this.getClass());
	}
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="getUserProfile",method=RequestMethod.GET)
	public String getUserProfile() throws Exception{
		
		System.out.println("/profile/getUserProfile");
		
		return "redirect:/view/profile/profile.jsp";
	}
	
	@RequestMapping(value="getCompanyProfile",method=RequestMethod.GET)
	public String getCompanyProfile() throws Exception{
		
		System.out.println("/profile/getCompanyProfile");
		
		return "forward:/view/profile/getCompanyProfile.jsp";
	}
	
	@RequestMapping(value="addCareerView",method=RequestMethod.GET)
	public String addCareer() throws Exception{
		
		System.out.println("/profile/addCareerView : GET");
		
		return "forward:/view/profile/addCareerView.jsp";
	}
	
	@RequestMapping(value="addCareer",method=RequestMethod.POST)
	public String addCareer(@ModelAttribute("career") Career career , HttpSession session) throws Exception{
		
		System.out.println("/profile/addCareer : POST");
		
		//String careerUserId = ((User)session.getAttribute("user")).getUserId();
		
		career.setCareerUserId("user05");
		
		profileService.addCareer(career);
		System.out.println(1234);
		return "redirect:/view/profile/profile.jsp";
	}
	
	@RequestMapping(value="getCareerList")
	public String getCareerList(@RequestParam("careerUserId")String careerUserId , Model model) throws Exception{
		
		System.out.println("/profile/getCareerList");
		
		Map<String , Object> map = profileService.getCareerList(careerUserId);
		
		model.addAttribute("list" , map.get("list"));
		
		return "forward:/view/profile/listCareer.jsp";
		
	}
	
	@RequestMapping(value="updateCareer",method=RequestMethod.GET)
	public String updateCareer(@RequestParam("careerUserId")String careerUserId , Model model) throws Exception{
		
		System.out.println("/profile/updateCareer : GET");
		
		Map<String , Object> career = profileService.getCareerList(careerUserId);
		
		model.addAttribute("career", career);
		
		return "forward:/view/profile/updateCareerView.jsp";
	}
	
	@RequestMapping(value="updateCareer",method=RequestMethod.POST)
	public String updateCareer(@ModelAttribute("career") Career career , Model model, HttpSession session) throws Exception{
		
		System.out.println("/profile/updateCareer : POST");
		
		//String careerUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.updateCareer(career,careerUserId);
		
		//List<Career> career2 = profileService.getCareerList(careerUserId);
		
		//model.addAttribute("career", career2);
		
		return "forward:/view/profile/getCareer.jsp";
	}
	
	@RequestMapping(value="deleteCareer/{careerNo}",method=RequestMethod.GET)
	public void deleteCareer(@PathVariable int careerNo) throws Exception{
		
		System.out.println("/profile/deleteCareer : GET");
		
		profileService.deleteCareer(careerNo);
		
	}
	
	@RequestMapping(value="addFollow/{targetUserId}",method=RequestMethod.GET)
	public void addFollow(@PathVariable String targetUserId ,HttpSession session) throws Exception{
		
		System.out.println("/profile/addFollow : POST");
		
		//String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.addFollow(reqUserId, targetUserId);
		
	}
	
	@RequestMapping(value="getFollowList/{reqUserId}")
	public String getFollowList(@PathVariable String reqUserId , Model model) throws Exception{
		
		System.out.println("/profile/getFollowList");
		
		List<Follow> list = profileService.getFollowList(reqUserId);
		
		model.addAttribute(list);
		
		return "forward:/view/profile/listFollow.jsp";
	}
	
	@RequestMapping(value="deleteFollow/{targetUserId}",method=RequestMethod.POST)
	public void deleteFollow(@PathVariable String targetUserId , HttpSession session) throws Exception{
		
		System.out.println("/profile/deleteFollow : POST");
		
		//String reqUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.deleteFollow(reqUserId, targetUserId);
	}
	
	@RequestMapping(value="addPortScrap/{portNo}" , method=RequestMethod.GET)
	public void addPortScrap(@PathVariable int portNo, HttpSession session ) throws Exception{
		
		System.out.println("/profile/addPortScrap");
		
		//String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.addPortScrap(scrapUserId, portNo);
	}
	
	@RequestMapping(value="addProjScrap/{projNo}" , method=RequestMethod.GET)
	public void addProjScrap(@PathVariable int projNo, HttpSession session ) throws Exception{
		
		System.out.println("/profile/addProjNoScrap");
		
		//String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.addPortScrap(scrapUserId, projNo);
	}
	
	@RequestMapping(value="getScrapList/{postNo}/{scrapDiv}")
	public String getScrapList(@PathVariable int postNo ,@PathVariable int scrapDiv , HttpSession session , Model model) throws Exception{
		
		System.out.println("profile/getScrapList");
		
		//String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		//List<Scrap> list = profileService.getScrapList(scrapDiv, scrapUserId, postNo);
		
		//model.addAttribute("list",list);
		
		return "forward:/view/profile/listScrap.jsp";
	}
	
	@RequestMapping(value="deleteScrpa/{postNo}/{scrapDiv}",method=RequestMethod.POST)
	public void deleteScrap(@PathVariable int postNo ,@PathVariable int scrapDiv) throws Exception{
		
		System.out.println("/profile/deleteScrap : POST");
		
		//String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		//profileService.deleteScrap(scrapUserId, scrapNo, scrapDiv);
	}

	
}





















