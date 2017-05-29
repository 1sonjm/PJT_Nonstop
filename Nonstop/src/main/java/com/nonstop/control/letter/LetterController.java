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
		
		return "forward:/view/letter/addLetterView.jsp";
	}
	
	@RequestMapping(value="addReturnLetter", method=RequestMethod.GET)
	public String addReturnLetter(@RequestParam("letNo")int letNo, Model model) throws Exception{
		
		System.out.println("/letter/addReturnLetter : GET");
		
		Letter letter = letterService.getLetter(letNo);
		
		model.addAttribute("letter",letter);
		
		return "forward:/view/letter/addReturnLetterView.jsp";
	}
	
	@RequestMapping(value="addLetter", method=RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter ) throws Exception{
		
		System.out.println("/letter/addLetter : POST");
		
		letterService.addLetter(letter);
		
		return "redirect:/letter/addLetterResult.jsp";
	}
	
	@RequestMapping(value="getReceiveLetterList")
	public String getReceiveLetterList(@RequestParam("receiveId")String receiveId , Model model ) throws Exception{
		
		System.out.println("/letter/getReceiveLetterList");
		
		Map<String,Object> map = letterService.getReceiveLetterList(receiveId);
		
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listReceiveLetter.jsp";

	}
	
	@RequestMapping(value="getSendLetterList")
	public String getSendLetterList(@RequestParam("sendId")String sendId , Model model ) throws Exception{
		
		System.out.println("/letter/getSendLetterList");
		
		Map<String,Object> map = letterService.getSendLetterList(sendId);
		
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listSendLetter.jsp";

	}
	
	@RequestMapping(value="getLetter", method=RequestMethod.GET)
	public String getLetter(@RequestParam("letNo") int letNo,Model model) throws Exception{
		
		System.out.println("/letter/getLetter:GET");
		
		letterService.updateReadDate(letNo);
		
		Letter letter = letterService.getLetter(letNo);
		
		model.addAttribute("letter",letter);
		
		return "forward:/view/letter/getLetter.jsp";
		
	}
	@RequestMapping(value="deleteLetter", method=RequestMethod.GET)
	public String deleteLetter(@RequestParam("letNo") int letNo,@RequestParam("receiveId") String receiveId, Model model)throws Exception{
		
		System.out.println("/letter/deleteLetter:GET");
		
		letterService.deleteLetter(letNo);
		
		Map<String,Object> map = letterService.getReceiveLetterList(receiveId);
		
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listLetter.jsp";
	}
}
