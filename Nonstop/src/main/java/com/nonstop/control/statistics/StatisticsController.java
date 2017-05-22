package com.nonstop.control.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value="addStatisticsData"/*, method=RequestMethod.GET*/)
	public String addStatisticsData(@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/addStatisticsData");
		statisticsService.addStatisticsData(statistics);
		
		return "redirect:/index.jsp";
	}
}
