package com.nonstop.control.letter;

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

import com.nonstop.domain.Follow;
import com.nonstop.domain.Letter;
import com.nonstop.domain.User;
import com.nonstop.service.letter.LetterService;
import com.nonstop.service.profile.ProfileService;

@Controller
@RequestMapping("/letter/*")
public class LetterController {
	
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	public LetterController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addLetter", method=RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter, HttpSession session, Model model) throws Exception{
		
		System.out.println("/letter/addLetter : POST");
		
		letterService.addLetter(letter);
		
		String sendId = ((User)session.getAttribute("user")).getUserId();
		
		String reqUserId = sendId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		Map<String,Object> map = letterService.getSendLetterList(sendId);
		
		model.addAttribute("list2", follow);
		model.addAttribute("list", map.get("list"));

		return "forward:/view/letter/listSendLetter.jsp";
	}
	
	@RequestMapping(value="getReceiveLetterList")
	public String getReceiveLetterList(@RequestParam("receiveId")String receiveId, Model model ) throws Exception{
		
		System.out.println("/letter/getReceiveLetterList");
		
		String reqUserId = receiveId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		Map<String,Object> map = letterService.getReceiveLetterList(receiveId);
		
		model.addAttribute("list2", follow);
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listReceiveLetter.jsp";

	}
	
	@RequestMapping(value="getSendLetterList")
	public String getSendLetterList(@RequestParam("sendId")String sendId , Model model ) throws Exception{
		
		System.out.println("/letter/getSendLetterList");
		
		String reqUserId =sendId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		Map<String,Object> map = letterService.getSendLetterList(sendId);
		
		model.addAttribute("list2", follow);
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listSendLetter.jsp";

	}
	
	@RequestMapping(value="getLetter", method=RequestMethod.GET)
	public String getLetter(@RequestParam("letNo") int letNo,@RequestParam("receiveId") String receiveId,HttpSession session,Model model) throws Exception{
		
		System.out.println("/letter/getLetter:GET");
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(receiveId)){
			
		letterService.updateReadDate(letNo);
		}
		
		Letter letter = letterService.getLetter(letNo);
		List<Follow> follow =profileService.getFollowList(sessionId);
		
		
		model.addAttribute("list2", follow);
		model.addAttribute("letter",letter);
		
		return "forward:/view/letter/getLetter.jsp";
		
	}

	@RequestMapping(value="addSave/{letNo}",method=RequestMethod.GET)
	public void updateSave(@PathVariable int letNo) throws Exception{
	
		System.out.println("/letter/updateSave");
		
		letterService.addSave(letNo);
	}
	
	@RequestMapping(value="deleteSave/{letNo}",method=RequestMethod.GET)
	public void deleteSave(@PathVariable int letNo) throws Exception{
	
		System.out.println("/letter/updateSave");
		
		letterService.deleteSave(letNo);
	}
	
	@RequestMapping(value="updateRecView" , method=RequestMethod.POST)
	public String updateRecView(@RequestParam(value="chbox") List<String> values,HttpSession session, Model model) throws Exception{
		
		System.out.println("profile/updateRecView");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		if(values !=null && values.size()>0){
			for(int i=0; i<values.size();i++){
			letterService.updateRecView(Integer.parseInt(values.get(i)), userId);
			}
		}
		String receiveId = userId;
		String reqUserId = receiveId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		Map<String,Object> map = letterService.getReceiveLetterList(receiveId);
		
		model.addAttribute("list2", follow);
		model.addAttribute("list",map.get("list"));
		return "forward:/view/letter/listReceiveLetter.jsp";
	}
	
	@RequestMapping(value="updateSendView" , method=RequestMethod.POST)
	public String updateSendView(@RequestParam(value="chbox") List<String> values,HttpSession session, Model model) throws Exception{
		
		System.out.println("letter/updateSendView");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		if(values !=null && values.size()>0){
			for(int i=0; i<values.size();i++){
			letterService.updateSendView(Integer.parseInt(values.get(i)), userId);
			}
		}
		String receiveId = userId;
		String reqUserId = receiveId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		Map<String,Object> map = letterService.getReceiveLetterList(receiveId);
		
		model.addAttribute("list2", follow);
		model.addAttribute("list",map.get("list"));
		return "forward:/view/letter/listReceiveLetter.jsp";
	}
	
	@RequestMapping(value="getSaveLetterList" , method=RequestMethod.GET)
	public String getSaveLetterList(@RequestParam("userId") String userId,Model model) throws Exception{
		
		System.out.println("letter/getSaveLetterList");
		
		Map<String , Object> map = letterService.getSaveLetterList(userId);
		
		String reqUserId = userId;
		
		List<Follow> follow =profileService.getFollowList(reqUserId);
		
		model.addAttribute("list2", follow);
		
		model.addAttribute("list",map.get("list"));
		
		return "forward:/view/letter/listSaveLetter.jsp";
	}
	
	@RequestMapping(value="updateReadDate", method=RequestMethod.POST)
	public String updateReadDate(@RequestParam(value="chbox") List<String> values , Model model , HttpSession session) throws Exception{
		
		System.out.println("letter/updateReadDate : GET");
		if(values != null && values.size()>0){
			for(int i=0 ; i<values.size(); i++){
			letterService.updateReadDate(Integer.parseInt(values.get(i)));
			}
		}
		String receiveId = ((User)session.getAttribute("user")).getUserId();
		
		Map<String , Object> map = letterService.getReceiveLetterList(receiveId);
		
		String reqUserId = receiveId;
		
		List<Follow> follow = profileService.getFollowList(reqUserId);
		
		model.addAttribute("list2" , follow);
		model.addAttribute("list", map.get("list"));
		
		return "forward:/view/letter/listReceiveLetter.jsp";
	}
	@RequestMapping(value = "toolbarMailCheck", method = RequestMethod.GET)
	public void toolbarMailCheck(HttpSession session , Model model) throws Exception {

		System.out.println("/letter/toolbarMailCheck : GET");
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		User user = (User)session.getAttribute("user");
		if(user!=null){
			if(letterService.getUnreadLetterList(userId).size() > 0){
				model.addAttribute("flag", true);
				System.out.println("트루");
			}else {
				model.addAttribute("flag", false);
				System.out.println("false");
			}
		}
	}
}











