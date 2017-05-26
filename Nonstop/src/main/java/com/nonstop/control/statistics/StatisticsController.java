package com.nonstop.control.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.Statistics;
import com.nonstop.service.statistics.StatisticsService;

@Controller
@RequestMapping("/statistics/*")
public class StatisticsController {

	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;	
	
	public StatisticsController(){
		System.out.println(this.getClass());
	}

	@RequestMapping(value="addStatisticsData", method=RequestMethod.POST)
	public String addStatisticsData(@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/addStatisticsData");
		statisticsService.addStatisticsData(statistics);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="getJSONListTechData", method=RequestMethod.POST)
	public void getJSONListTechData(Model model,@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONListTechData");
		model.addAttribute("techDataList", statisticsService.getTechDataList(statistics.getTechClass()));
	}
	
	@RequestMapping(value="getListTotalStatistics", method=RequestMethod.GET)
	public String getListTotalStatistics(Model model){
		System.out.println("/statstics/getListTotalStatistics");
		
		model.addAttribute("techClassList",statisticsService.getTechClassList());
		
		return "forward:/view/statistics/getStatistics.jsp";
	}
	
	@RequestMapping(value="getJSONListTotalStatistics", method=RequestMethod.POST)
	public void getJSONListTotalStatistics(Model model){
		System.out.println("/statstics/getJSONListTotalStatistics");
		model.addAttribute("dataList", statisticsService.getTotalStatisticsList());
	}
	
	@RequestMapping(value="getJSONMajorStatisticsList", method=RequestMethod.POST)
	public void getJSONMajorStatisticsList(Model model, @RequestParam("techClass") int techClass){
		System.out.println("/statstics/getJSONMajorStatisticsList");
		model.addAttribute("dataList", statisticsService.getMajorStatisticsList(techClass));
	}
	
	@RequestMapping(value="getJSONPeriodStatisticsList", method=RequestMethod.POST)
	public void getJSONPeriodStatisticsList(Model model, @ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONPeriodStatisticsList");
		model.addAttribute("dataList", statisticsService.getPeriodStatisticsList(statistics));
	}
	
	@RequestMapping(value="getJSONRegionStatisticsList", method=RequestMethod.POST)
	public void getJSONRegionStatisticsList(Model model, @ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/getJSONRegionStatisticsList");
		model.addAttribute("dataList", statisticsService.getRegionStatisticsList(statistics));
	}
	
	@RequestMapping(value="getJSONPostCountList", method=RequestMethod.POST)
	public void getJSONPostCountList(Model model){
		System.out.println("/statstics/getJSONPostCountList");
		model.addAttribute("dataList", statisticsService.getPostCountList());
	}
	
	//include로 화면 구성된다고 한다.
	@RequestMapping(value="getUserStatisticsList", method=RequestMethod.GET)
	public String getUserStatisticsList(Model model){
		System.out.println("/statstics/getUserStatisticsList");
		model.addAttribute("dataList", statisticsService.getPostCountList());
		return ".jsp";
	}
	
}
