package com.nonstop.control.statistics;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(value="addStatisticsData", method=RequestMethod.POST)
	public String addStatisticsData(@ModelAttribute("statistics") Statistics statistics){
		System.out.println("/statstics/addStatisticsData");
		statisticsService.addStatisticsData(statistics);
		
		return "redirect:/index.jsp";
	}

	@RequestMapping(value="turnOnStatisticsSync/{a}", method=RequestMethod.POST)
	public String turnOnStatisticsSync(HttpSession session, @PathVariable String a){
		System.out.println("/statstics/turnOnStatisticsSync");
		System.out.println("#"+a);
		
		return "redirect:/index.jsp";
	}
	@RequestMapping(value="turnOffStatisticsSync/{a}", method=RequestMethod.POST)
	public String turnOffStatisticsSync(HttpSession session, @PathVariable String a){
		System.out.println("/statstics/turnOffStatisticsSync");
		System.out.println("#"+a);
		
		return "redirect:/index.jsp";
	}
}
