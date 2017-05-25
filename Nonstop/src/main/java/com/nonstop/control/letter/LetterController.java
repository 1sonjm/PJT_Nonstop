package com.nonstop.control.letter;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.Letter;
import com.nonstop.domain.Page;
import com.nonstop.domain.Search;
import com.nonstop.service.letter.LetterService;

@Controller
@RequestMapping("/letter/*")
public class LetterController {
	
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	public LetterController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addLetter", method=RequestMethod.GET)
	public String addLetter() throws Exception{
		
		System.out.println("/letter/addLetter : GET");
		
		return "redirect:/letter/addLetterView.jsp";
	}
	
	@RequestMapping(value="addLetter", method=RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter ) throws Exception{
		
		System.out.println("/letter/addLetter : POST");
		
		letterService.addLetter(letter);
		
		return "redirect:/letter/addLetterResult.html";
	}
	
	/*@RequestMapping(value="listLetter")
	public String listLetter(@ModelAttribute("search")Search search , Model model ) throws Exception{
		
		System.out.println("/letter/listLetter : GET/POST");
		
		if(search.getCurrentPage() ==0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = letterService.listLetter(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return null;

	}
	
	@RequestMapping(value="getLetter", method=RequestMethod.GET)
	public String getLetter(@RequestParam("letterNo") int letterNo,Model model) throws Exception{
		
		System.out.println("/letter/getLetter:GET");
		
		Letter letter = letterService.getLetter(letterNo);
		
		model.addAttribute("letter",letter);
		
		return null;
		
	}
	@RequestMapping(value="deleteLetter", method=RequestMethod.GET)
	public String deleteLetter(@RequestParam("letterNo") int letterNo, Model model)throws Exception{
		
		System.out.println("/letter/deleteLetter:GET");
		
		letterService.deleteLetter(letterNo);
		
		return null;
		
	}*/
}






