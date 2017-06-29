package com.nonstop.control.portfolio;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nonstop.domain.Follow;
import com.nonstop.domain.PortComment;
import com.nonstop.domain.PortImages;
import com.nonstop.domain.PortLike;
import com.nonstop.domain.Portfolio;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
import com.nonstop.domain.TechUse;
import com.nonstop.domain.User;
import com.nonstop.service.portfolio.PortfolioService;
import com.nonstop.service.profile.ProfileService;
import com.nonstop.service.techuse.TechUseService;
import com.nonstop.service.user.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/portfolio/*")
public class PortfolioController {
	
	@Autowired
	@Qualifier("portfolioServiceImpl")
	private PortfolioService portfolioService;
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("techUseServiceImpl")
	private TechUseService techUseService;
	
	public PortfolioController() {

	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="addPortfolio", method=RequestMethod.GET)
	public String addPortfolio() throws Exception {
		
		return "forward:/view/portfolio/addPortfolioView.jsp";
	}
	
	@RequestMapping(value="addPortfolio", method=RequestMethod.POST)
	public String addPortfolio(@ModelAttribute("portfolio") Portfolio portfolio, 
										@RequestParam("checkBoxes") int [] items,
										MultipartHttpServletRequest file, Model model) throws Exception {
				
		//@RequestParam("portFileName") MultipartFile file : 하나의 파일을 받을 때 사용. portFileName 한개를 MultipartFile을 데이터타입으로 하는 file에 담아온다.
		//MultipartHttpServletRequest file :  여러개의 파일을 받기위해 사용. getFiles 메소드를 통해 파일을 List 형태로 받을 수 있다.
		
		//JSP에서 넘어온 <input> 태그의 name을 알고있다면 getFile(), 모른다면 getFileNames()사용
		List<MultipartFile> uploadFiles = file.getFiles("portFileName[]");
		List<PortImages> images = new ArrayList(); 
		
		System.out.println("uploadFiles : "+uploadFiles);
		
		if(uploadFiles.size() == 1) {
			//확장자 구하기
			String portFile = uploadFiles.get(0).getOriginalFilename();
			int index = portFile.lastIndexOf(".");
			String ext = portFile.substring(index+1);
			
			portfolio.setPortFile(portFile);
			
			System.out.println("ext : "+ext+" / portFile : "+portFile);
			//pdf 파일이면 thumbnail 추출
			if(ext == "pdf") {
				portfolio.setPortFile("pdf_img.jpg");
			} else if(ext == "odf") {
				portfolio.setPortFile("ppt_img.jpg");
			}
			//파일 업로드 실행
			try {
	            // 1. FileOutputStream 사용
	            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
	             
	            // 2. File 사용
	            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile);
	            uploadFiles.get(0).transferTo(uploadFile);
	            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
	            //File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile); 맨 뒤에 '/'를 붙여야 한다.
	            //'/'를 붙이지 않으면 파일이름 앞에 upload가 붙는다.
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		
		}else {
			
			for(int i=0 ; i<uploadFiles.size() ; i++) {
				//portImages를 밖에서 생성하면 마지막 값이 덮어쓰기 된다. 참조형 자료형이라서? 아무튼 안에서 생성해야 정상적으로 작동
				//아마도 add하는 값이 들어가는게 아니라 주소값이 list에 들어가기 때문인듯 하다.
				PortImages portImages = new PortImages();
				
				String portFile = uploadFiles.get(i).getOriginalFilename();
				
				if(i == 0){
					//썸네일 이미지 등록
					portfolio.setPortFile(portFile);
				}
				
				portImages.setImgName(portFile);
				portImages.setImgOrder(i);
				
				images.add(portImages);
				portfolio.setImages(images);
				
			}//end for문
			//파일 업로드 실행
			for(int i=0 ; i<uploadFiles.size() ; i++) {
				try {
		            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + images.get(i).getImgName());
		            uploadFiles.get(i).transferTo(uploadFile);
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
			}
		}//end if-else문
		///////////// 이미지 업로드 END /////////////
		
		// 사용기술 업로드 START
		int tuPortNo = portfolioService.addPortfolio(portfolio);
		
		System.out.println(tuPortNo);
		
		if(items.length > 0){
			for(int i=0; i<items.length;i++){
				techUseService.addTechUsePort(items[i], tuPortNo);
			}
		}//END
		
		return "redirect:/view/portfolio/addPortfolioView.jsp";
	}
	
	@RequestMapping(value="listPortfolio")
	public String listPortfolio(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		//scrap 플래그 위한 session의 user정보
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}
		
		//검색조건이 있는 경우 : 랭킹과 리스트를 리턴하지 않는다. 검색 결과만 리턴
		if(search.getSearchKeyword() != null){
			//모두 가져오기 임시설정
			search.setEndNum(100);
			String postDivision = String.valueOf(search.getPostDivision());
			
			if(postDivision.startsWith("1")){
				search.setPostDivision(1);
			}else{
				search.setPostDivision(2);
			}
			
			List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);
			
			model.addAttribute("list", portfolioList);
			
			return "forward:/view/portfolio/listPortfolio.jsp";
		}
		
		//16개씩 리스트 가져오기
		if(search.getEndNum() == 0) {
			search.setStartNum(1);
			search.setEndNum(16);
		}else{
			int startNum = search.getEndNum()+1;
			int endNum = startNum+16;

			search.setStartRowNum(startNum);
			search.setEndRowNum(endNum);
		}
		
		List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);
		
		//Portfolio Ranking 출력
		search.setStartNum(1);
		search.setEndNum(12);
		
		//search.postDivision의 맨 앞글자가 1이면 개발 전체, 2이면 디자인 전체로 세팅
		String postDivision = String.valueOf(search.getPostDivision());
		
		if(postDivision.startsWith("1")){
			search.setPostDivision(1);
		}else{
			search.setPostDivision(2);
		}
		//추천순으로 나열
		search.setPostSorting(3);
		
		List<Portfolio> portRanking = portfolioService.getPortfolioList(search, sessionUserId);

		model.addAttribute("list", portfolioList);
		model.addAttribute("ranking", portRanking);

		return "forward:/view/portfolio/listPortfolio.jsp";
	}
	
	//무한스크롤 용 listPortfolio. ajax로 요청이 들어오면 16개씩 list를 보내준다. Json타입으로 보내주기 위해 @ResponseBody사용
	@RequestMapping(value="listJsonPortfolio", method = RequestMethod.POST)
	@ResponseBody
	public List<Portfolio> listJsonPortfolio(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}

		int startNum = search.getEndNum()+1;
		int endNum = startNum+15;

		search.setStartNum(startNum);
		search.setEndNum(endNum);

		List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);

		return portfolioList;
	}
	
	@RequestMapping(value="getPortfolio")
	public String getPortfolio(@RequestParam("portNo") int portNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("getPortfolio Controller");
		
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}
		//스크랩, getPortfolio, 좋아요 플래그
		Portfolio portfolio = portfolioService.getPortfolio(portNo,sessionUserId);
		
		if(portfolio.getPortLikeNo()!=0){
			portfolio.setPortLikeFlag(true);
		}
		//댓글
		List<PortComment> portCommentList = portfolioService.getCommentList(portNo);
		//팔로우 플래그
		Follow follow = profileService.getFollow(sessionUserId, portfolio.getPortUserId());
		
		if(follow != null){
			portfolio.setPortFollowFlag(true);
		}
		
		//게시자 미니프로필용 user
		User user = userService.getUser(portfolio.getPortUserId());
		
		//클릭시 조회수 추가
		int portViewCount = portfolio.getTotalPortView();
		portfolio.setTotalPortView(++portViewCount);
		portfolio.setPortViewFlag(true);		
		portfolioService.updatePortCount(portfolio);
		
		//수정된 게시물의 경우 
		if(portfolio.getPortUpdate() != null){
			portfolio.setPortRegdate(portfolio.getPortUpdate());
		}
		
		//날짜계산
		String regdate = portfolio.getPortRegdate().toString();
		String portMonth = regdate.substring(5, 7);
		
		System.out.println(portMonth);
		
		switch(portMonth){
		
			case "01": portMonth = "January"; break;
			case "02": portMonth = "Febuary"; break;
			case "03": portMonth = "March"; break;
			case "04": portMonth = "April"; break;
			case "05": portMonth = "May"; break;
			case "06": portMonth = "June"; break;
			case "07": portMonth = "July"; break;
			case "08": portMonth = "August"; break;
			case "09": portMonth = "September"; break;
			case "10": portMonth = "October"; break;
			case "11": portMonth = "November"; break;
			case "12": portMonth = "December"; break;
		
		}
		
		portfolio.setPortYear(regdate.substring(0, 4));
		portfolio.setPortMonth(portMonth);
		portfolio.setPortDay(regdate.substring(8, 10));
		
		System.out.println("getPortfolio portfolio : "+portfolio);

		
		model.addAttribute("portCommentList", portCommentList);
		model.addAttribute("portfolio", portfolio);
		model.addAttribute("user", user);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}

	@RequestMapping(value="updatePortfolio", method=RequestMethod.GET)
	public String updatePortfolio(@RequestParam("portNo") int portNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("updatePortfolio Controller");
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		Portfolio portfolio = portfolioService.getPortfolio(portNo,scrapUserId);
		
		System.out.println("getPortfolio portfolio : "+portfolio);
		
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/view/portfolio/updatePortfolioView.jsp";
	}
	
	@RequestMapping(value="updatePortfolio", method=RequestMethod.POST)
	public String updatePortfolio(@ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFileName") MultipartFile file, Model model) throws Exception {
				
		String portFile=file.getOriginalFilename();
		
		System.out.println("portFile : "+portFile);
		
		portfolio.setPortFile(portFile);
		
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
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile);
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
	
	@RequestMapping(value="deletePortfolio")
	public String deletePortfolio(@RequestParam("portNo") int portNo) throws Exception {
		techUseService.deleteTechUsePort(portNo);
		portfolioService.deletePortfolio(portNo);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value={"addJsonComment"}, method=RequestMethod.POST)
	public void addJsonComment( @ModelAttribute("portComment") PortComment portComment, HttpSession session, Model model ) throws Exception {
		
		System.out.println("/addJsonComment");
		
		System.out.println("portComment : "+portComment);
		
		portfolioService.addComment(portComment);
		portComment = portfolioService.getComment(portComment.getComNo());
		//총 댓글갯수 추가
		Portfolio portfolio = portfolioService.getPortfolio(portComment.getComPortNo(), "testUserId");
		portfolio.setTotalPortComment(portfolio.getTotalPortComment()+1);
		portfolio.setPortCommentFlag(true);
		portfolioService.updatePortCount(portfolio);
	}
	
	@RequestMapping(value="deleteComment/{comNo}/{comPortNo}" , method=RequestMethod.GET)
	public void deleteComment(@PathVariable("comNo") int comNo, @PathVariable("comPortNo") int comPortNo, Model model) throws Exception{
		
		portfolioService.deleteComment(comNo);
		
		Portfolio portfolio = portfolioService.getPortfolio(comPortNo, "testUserId");
		portfolio.setTotalPortComment(portfolio.getTotalPortComment()-1);
		portfolio.setPortCommentFlag(true);
		portfolioService.updatePortCount(portfolio);
		
	}
	
	@RequestMapping(value="addJsonPortLike" , method=RequestMethod.POST)
	public void addJsonPortLike(@ModelAttribute("portLike") PortLike portLike) throws Exception{
		
		System.out.println("/portfolio/addJsonPortLike");
		
		Portfolio portfolio = portfolioService.getPortfolio(portLike.getPortNo(), portLike.getUserId());
		//클릭시 추천수 추가
		portfolio.setTotalPortLike(portfolio.getTotalPortLike()+1);
		portfolio.setPortLikeFlag(true);
		portfolioService.updatePortCount(portfolio);
		
		portfolioService.addPortLike(portLike);
		
	}
	
	@RequestMapping(value="delJsonPortLike" , method=RequestMethod.POST)
	public void delJsonPortLike(@ModelAttribute("portLike") PortLike portLike) throws Exception{
		
		System.out.println("/portfolio/delJsonPortLike");
	
		Portfolio portfolio = portfolioService.getPortfolio(portLike.getPortNo(), portLike.getUserId());
		
		System.out.println("djfjowiejfojofgmkfl : "+portfolio.getTotalPortLike());
		
		//클릭시 추천수 감소
		portfolio.setTotalPortLike(portfolio.getTotalPortLike()-1);
		portfolio.setPortLikeFlag(true);
		portfolioService.updatePortCount(portfolio);
		
		portfolioService.deletePortLike(portLike.getPortLikeNo());
		
	}
	
	@RequestMapping(value="getJSONPortfolioList/{target}/{currentPage}/{sorting}", method=RequestMethod.GET)
   public void getJSONPortfolioList(@PathVariable("target")String target
         ,@PathVariable("currentPage")int currentPage
         ,@PathVariable("sorting")int sorting, Model model) throws Exception {

      System.out.println("/portfolio/getJSONPortfolioList");
      
      String sessionUserId="testUser";
      
      Search search = new Search();
      search.setCurrentPage(currentPage);
      search.setPostSorting(sorting);
      search.setStartNum((currentPage*5)-5);
      search.setEndNum(currentPage*5);
      
      switch(target){
      case "develop":
         search.setPostDivision(1);
         break;
      case "design":
         search.setPostDivision(2);
         break;
      }
      List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);

      model.addAttribute("list", portfolioList);
   }

   @RequestMapping(value="getJSONPortfolio/{portNo}")
	public String getJSONPortfolio(Model model,@PathVariable("portNo") int portNo) throws Exception {
		
		System.out.println("/portfolio/getJSONPortfolio");
		
		String sessionUserId="testUser";
		
		//스크랩, getPortfolio, 좋아요 플래그
		Portfolio portfolio = portfolioService.getPortfolio(portNo,sessionUserId);
		
		if(portfolio.getPortLikeNo()!=0){
			portfolio.setPortLikeFlag(true);
		}
		//댓글
		List<PortComment> portCommentList = portfolioService.getCommentList(portNo);
		//팔로우 플래그
		Follow follow = profileService.getFollow(sessionUserId, portfolio.getPortUserId());
		
		if(follow != null){
			portfolio.setPortFollowFlag(true);
		}
		
		//클릭시 조회수 추가
		int portViewCount = portfolio.getTotalPortView();
		portfolio.setTotalPortView(++portViewCount);
		portfolio.setPortViewFlag(true);		
		portfolioService.updatePortCount(portfolio);
		
		//수정된 게시물의 경우 
		if(portfolio.getPortUpdate() != null){
			portfolio.setPortRegdate(portfolio.getPortUpdate());
		}
		
		//날짜계산
		String regdate = portfolio.getPortRegdate().toString();
		String portMonth = regdate.substring(5, 7);
		
		System.out.println(portMonth);
		
		switch(portMonth){
		
			case "01": portMonth = "January"; break;
			case "02": portMonth = "Febuary"; break;
			case "03": portMonth = "March"; break;
			case "04": portMonth = "April"; break;
			case "05": portMonth = "May"; break;
			case "06": portMonth = "June"; break;
			case "07": portMonth = "July"; break;
			case "08": portMonth = "August"; break;
			case "09": portMonth = "September"; break;
			case "10": portMonth = "October"; break;
			case "11": portMonth = "November"; break;
			case "12": portMonth = "December"; break;
		
		}
		
		portfolio.setPortYear(regdate.substring(0, 4));
		portfolio.setPortMonth(portMonth);
		portfolio.setPortDay(regdate.substring(8, 10));
		
		System.out.println("getPortfolio portfolio : "+portfolio);

		
		model.addAttribute("portCommentList", portCommentList);
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}
   @RequestMapping(value="addJSONPortfoiloComment/{portNo}")
	public void addJSONPortfoiloComment(Model model,@PathVariable("portNo") int portNo
			,@RequestBody JSONObject JsonData) throws Exception {
		System.out.println("/portfolio/addJSONPortfoiloComment");
		System.out.println(JsonData.toString());
		
		//portfolioService.addComment(portComment);
		
		//portComment = portfolioService.getComment(portComment.getComNo());
		
		//model.addAttribute("portComment", portComment);
	}

}
