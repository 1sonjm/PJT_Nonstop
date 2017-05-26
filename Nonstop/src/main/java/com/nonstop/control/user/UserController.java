package com.nonstop.control.user;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.nonstop.domain.Page;
import com.nonstop.domain.Search;
import com.nonstop.domain.User;
import com.nonstop.service.user.UserService;




//==> ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/view/user/addUserView.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user,@RequestParam("file") MultipartFile file, Model model) throws Exception {

		System.out.println("/user/addUser : POST");
		
		String image=file.getOriginalFilename();
		
		
		user.setImage(image);
		
		//user.setUserId("user");
		
		
		
        try {
            // 1. FileOutputStream 사용
            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
             
            // 2. File 사용
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
            file.transferTo(uploadFile);
            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
            //문제2. 실제 파일 이름과 업로드되는 파일의 이름이 다르다. 앞에 upload가 붙는다. 그냥 붙여서 넣으면되네
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		//Business Logic
		// userService.addUser(user);
		/*MultipartFile file=user.getFile();
		if(file !=null){
			String image=file.getOriginalFilename();
			user.setImage(image);
			
			File filetemp=new File(session.getServletContext().getRealPath("/")+"images\\uploadFiles\\" + user.getImage());
		}*/
		userService.addUser(user);
		
		return "redirect:/view/user/loginView.jsp";
		
	}
		
		
	@RequestMapping( value="addCompany", method=RequestMethod.GET )
	public String addCompany() throws Exception{
	
		System.out.println("/user/addCompany : GET");
		
		return "redirect:/view/user/addCompanyView.jsp";
	}
	
	@RequestMapping( value="addCompany", method=RequestMethod.POST )
	public String addCompany( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addCompany : POST");
		//Business Logic
		userService.addCompany(user);
		
		return "redirect:/view/user/loginView.jsp";
	}
	

	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/view/user/getUser.jsp";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping( value="getJsonUser/{userId}", method=RequestMethod.GET )
	public void getJsonUser(	@PathVariable String userId, 
									 			Model model) throws Exception{
		
		System.out.println("/getJsonUser/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/view/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/view/user/getUser?userId="+user.getUserId();
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/view/user/loginView.jsp";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		return "redirect:/index.jsp";
		//return "redirect:/index.jsp";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping( value="jsonLogin", method=RequestMethod.POST )
	public void jsonLogin(	@RequestBody User user,
												HttpSession session,
												Model model) throws Exception{
	
		System.out.println("/user/jsonLogin : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());

		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			model.addAttribute("user", dbUser);
		}else{
			model.addAttribute("user", null);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model �� View ����
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/view/user/checkDuplication.jsp";
	}

	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/view/user/listUser.jsp";
	}
	
	@RequestMapping( value="checkUserId/{userId}", method=RequestMethod.GET)
	   public void checkUserId(  @PathVariable String userId, Model model) throws Exception {
	      
	      System.out.println("/user/checkUserId : GET");
	      
	      boolean result = userService.checkUserId(userId);
	      
	      model.addAttribute("result", new Boolean(result));
	      
	   }
	
	
	/*@RequestMapping(value="addImage", method=RequestMethod.POST)
	   public String addImage(@ModelAttribute("user") User user, @RequestParam("imageName") MultipartFile file, Model model) throws Exception {
	            
	      String image=file.getOriginalFilename();
	      
	      System.out.println("image : "+image);
	      
	      user.setImage(image);
	      
	      //user를 세션을 통해 받아와야 하는데 아직 로그인을 할 수 없으니 임시로 넣는다
	      //나중에 수정할 부분이다!!
	      user.setUserId("user");
	      
	      System.out.println("addUser : "+user);
	      
	        try {
	            // 1. FileOutputStream 사용
	            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
	             
	            // 2. File 사용
	            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
	            file.transferTo(uploadFile);
	            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
	            //File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile); 맨 뒤에 '/'를 붙여야 한다.
	            //'/'를 붙이지 않으면 파일이름 앞에 upload가 붙는다.
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	   
	      userService.addUser(user);
	      
	      model.addAttribute("user",user);
	      
	      return "forward:/view/portfolio/getUser.jsp";
	   }*/
	   
	
	
	
}