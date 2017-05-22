package com.nonstop.control.portfolio;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
@RequestMapping("/portfolio/*")
public class PortfolioController {
	
	@Autowired
	@Qualifier("portfolioServiceImpl")
	private PortfolioService portfolioService;
	
	public PortfolioController() {

	}

	@RequestMapping(value="addPortfolio", method=RequestMethod.GET)
	public String addPortfolio() throws Exception {
		
		return "forward:/portfolio/addPortfolioView.jsp";
	}
	
	@RequestMapping(value="addPortfolio", method=RequestMethod.POST)
	public String addPortfolio(@ModelAttribute("portfolio") Portfolio portfolio ,Model model) throws Exception {
		
		portfolioService.addPortfolio(portfolio);
		
		model.addAttribute("portfolio",portfolio);
		
		return "forward:/portfolio/getPortfolio.jsp";
	}
	
	@RequestMapping(value="listPortfolio")
	public String listPortfolio(Model model) throws Exception {
		
		List<Portfolio> portfolioList = portfolioService.getPortfolioList();
		
		model.addAttribute("list", portfolioList);
		
		return "forward:/portfolio/listPortfolio.jsp";
	}
	
	@RequestMapping(value="getPortfolio")
	public String getPortfolio( @RequestParam("portNo") int portNo, Model model) throws Exception {
		
		System.out.println("getPortfolio Controller");
		
		Portfolio portfolio = portfolioService.getPortfolio(portNo);
		
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/portfolio/getPortfolio.jsp";
	}

}
