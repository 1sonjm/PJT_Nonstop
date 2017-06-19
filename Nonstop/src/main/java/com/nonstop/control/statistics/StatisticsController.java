package com.nonstop.control.statistics;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.Statistics;
import com.nonstop.domain.User;
import com.nonstop.service.letter.LetterService;
import com.nonstop.service.statistics.StatisticsService;

@Controller
@RequestMapping("/statistics/*")
public class StatisticsController {

	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;
	
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	public StatisticsController(){
		System.out.println(this.getClass());
	}

	@RequestMapping(value="addStatisticsData", method=RequestMethod.POST)
	public String addStatisticsData(@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/addStatisticsData");
		statisticsService.addStatisticsData(statistics);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="getJSONListTechClass", method=RequestMethod.GET)
	public void getJSONListTechClass(Model model){
		System.out.println("/statstics/getJSONListTechClass");
		model.addAttribute("techClassList",statisticsService.getTechClassList());
	}
	@RequestMapping(value="getJSONListTechData", method=RequestMethod.GET)
	public void getJSONListTechData(Model model,@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONListTechData");
		model.addAttribute("techDataList", statisticsService.getTechDataList(statistics.getTechClass()));
	}
	
	@RequestMapping(value="getListStatistics", method=RequestMethod.GET)
	public String getListTotalStatistics(Model model){
		System.out.println("/statstics/getListTotalStatistics");

		model.addAttribute("techClassList",statisticsService.getTechClassList());
		model.addAttribute("techDataList",statisticsService.getTechDataList(1));
		
		return "forward:/view/statistics/getStatistics.jsp";
	}
	
	@RequestMapping(value="getJSONListTotalStatistics", method=RequestMethod.GET)
	public void getJSONListTotalStatistics(Model model){
		System.out.println("/statstics/getJSONListTotalStatistics");
		model.addAttribute("dataList", statisticsService.getTotalStatisticsList());
	}
	
	@RequestMapping(value="getJSONMajorStatisticsList", method=RequestMethod.GET)
	public void getJSONMajorStatisticsList(Model model, @ModelAttribute("statistics") Statistics statistics, @RequestParam("aa") int division){
		System.out.println("/statstics/getJSONMajorStatisticsList");
		model.addAttribute("dataList", statisticsService.getMajorStatisticsList(statistics.getTechClass(),division));
	}
	
	@RequestMapping(value="getJSONPeriodStatisticsList", method=RequestMethod.GET)
	public void getJSONPeriodStatisticsList(Model model, @ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONPeriodStatisticsList");
		model.addAttribute("dataList", statisticsService.getPeriodStatisticsList(statistics));
	}
	
	@RequestMapping(value="getJSONRegionStatisticsList", method=RequestMethod.GET)
	public void getJSONRegionStatisticsList(Model model, @ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONRegionStatisticsList");
		model.addAttribute("dataList", statisticsService.getRegionStatisticsList(statistics));
	}
	
	@RequestMapping(value="getJSONPostCountList", method=RequestMethod.GET)
	public String getJSONPostCountList(Model model , HttpSession session) throws Exception{
		System.out.println("/statstics/getJSONPostCountList");
		
		model.addAttribute("dataList", statisticsService.getPostCountList());
		
		User user = null;
		if((user=(User)session.getAttribute("user"))!=null){
		if(letterService.getUnreadLetterList(user.getUserId()).size() > 0){
			model.addAttribute("flag", true);
		}else {
			model.addAttribute("flag", false);
			}
		}
		return "/index.jsp";
	}
	
	@RequestMapping(value="getUserStatisticsList/{userId}/{role}", method=RequestMethod.GET)
	public void getJSONUserStatisticsList(Model model,@PathVariable("userId")String userId, @PathVariable("role")String role){
		System.out.println("/statstics/getUserStatisticsList");
		User user = new User();
		user.setUserId(userId);
		user.setRole(role);
		model.addAttribute("dataList", statisticsService.getUserStatisticsList(user));
	}
	
}
