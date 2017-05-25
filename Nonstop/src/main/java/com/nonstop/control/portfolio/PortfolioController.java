package com.nonstop.control.portfolio;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

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
		
		return "forward:/view/portfolio/addPortfolioView.jsp";
	}
	
	@RequestMapping(value="addPortfolio", method=RequestMethod.POST)
	public String addPortfolio(@ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFileName") MultipartFile file, Model model) throws Exception {
				
		String portFile=file.getOriginalFilename();
		
		System.out.println("portFile : "+portFile);
		
		portfolio.setPortFile("upload"+portFile);
		
		//user를 세션을 통해 받아와야 하는데 아직 로그인을 할 수 없으니 임시로 넣는다
		//나중에 수정할 부분이다!!
		portfolio.setPortUserId("user01");
		
		System.out.println("addPortfolio : "+portfolio);
		
        try {
            // 1. FileOutputStream 사용
            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
             
            // 2. File 사용
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload" + portFile);
            file.transferTo(uploadFile);
            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
            //문제2. 실제 파일 이름과 업로드되는 파일의 이름이 다르다. 앞에 upload가 붙는다. 그냥 붙여서 넣으면되네
        } catch (IOException e) {
            e.printStackTrace();
        }
	
		portfolioService.addPortfolio(portfolio);
		
		model.addAttribute("portfolio",portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}
	
	@RequestMapping(value="listPortfolio")
	public String listPortfolio(Model model) throws Exception {
		
		List<Portfolio> portfolioList = portfolioService.getPortfolioList();
		
		model.addAttribute("list", portfolioList);
		
		return "forward:/portfolio/listPortfolio.jsp";
	}
	
	@RequestMapping(value="getPortfolio")
	public String getPortfolio(Model model) throws Exception {
	/*public String getPortfolio( @RequestParam("portNo") int portNo, Model model) throws Exception {*/
		
		System.out.println("getPortfolio Controller");
		
		int portNo = 1;
		
		Portfolio portfolio = portfolioService.getPortfolio(portNo);
		
		System.out.println("getPortfolio portfolio : "+portfolio);
		
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}

	@RequestMapping(value="updatePortfolio", method=RequestMethod.GET)
	public String updatePortfolio(Model model) throws Exception {
		
		System.out.println("updatePortfolio Controller");
		
		//getPortfolio.jsp에서 hidden 태그로 숨겨서 가져와야햇!!! 나중에수정햇!!
		int portNo = 1;
		
		Portfolio portfolio = portfolioService.getPortfolio(portNo);
		
		System.out.println("getPortfolio portfolio : "+portfolio);
		
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/view/portfolio/updatePortfolioView.jsp";
	}
	
	@RequestMapping(value="updatePortfolio", method=RequestMethod.POST)
	public String updatePortfolio(@ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFileName") MultipartFile file, Model model) throws Exception {
				
		String portFile=file.getOriginalFilename();
		
		System.out.println("portFile : "+portFile);
		
		portfolio.setPortFile("upload"+portFile);
		
		//user를 세션을 통해 받아와야 하는데 아직 로그인을 할 수 없으니 임시로 넣는다
		//나중에 수정할 부분이다!!
		portfolio.setPortUserId("user01");
		
		//getPortfolio.jsp에서 hidden 태그로 숨겨서 가져와야햇!!! 나중에수정햇!!
		int portNo = 1;
		portfolio.setPortNo(portNo);
		
		System.out.println("addPortfolio : "+portfolio);
		
        try {
            // 1. FileOutputStream 사용
            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
             
            // 2. File 사용
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload" + portFile);
            file.transferTo(uploadFile);
            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
            //문제2. 실제 파일 이름과 업로드되는 파일의 이름이 다르다. 앞에 upload가 붙는다. 그냥 붙여서 넣으면되네
        } catch (IOException e) {
            e.printStackTrace();
        }
	
		portfolioService.updatePortfolio(portfolio);
		
		model.addAttribute("portfolio",portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}
	
	
}
