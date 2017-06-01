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



@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//setter Method

		
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
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
		userService.addUser(user);
		
		return "redirect:/view/user/loginView.jsp";
	}
	
	@RequestMapping( value="addCompany", method=RequestMethod.GET )
	public String addCompany() throws Exception{
	
		System.out.println("/user/addCompany : GET");
		
		return "redirect:/view/user/addCompanyView.jsp";
	}
	
	@RequestMapping( value="addCompany", method=RequestMethod.POST )
	public String addCompany( @ModelAttribute("user") User user,@RequestParam("logoFile") MultipartFile file) throws Exception {

		System.out.println("/user/addCompany : POST");

		String image=file.getOriginalFilename();

		user.setImage(image);
		
		//user.setUserId("user");
        try {
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
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

	

		model.addAttribute("user", user);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping( value="getCompany", method=RequestMethod.GET )
	public String getCompany( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getCompany : GET");
		//Business Logic
		User user = userService.getCompany(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/view/user/getCompany.jsp";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping( value="getJsonCompany/{userId}", method=RequestMethod.GET )
	public void getJsonCompany(	@PathVariable String userId, 
									 			Model model) throws Exception{
		
		System.out.println("/getJson/getCompany : GET");
		//Business Logic
		User user = userService.getCompany(userId);
		
		model.addAttribute("user", user);
	}

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);

		model.addAttribute("user", user);
		
		return "forward:/view/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session, @RequestParam("updateFile") MultipartFile file) throws Exception{
		
		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
			String image=file.getOriginalFilename();

			user.setImage(image);
			
			//user.setUserId("user");
	        try {
	            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
	            file.transferTo(uploadFile);
	        } catch (IOException e) {
	            e.printStackTrace();	
		}
		
	        
	        return "forward:/view/user/getUser.jsp";
		/*return "redirect:/view/user/getUser?userId="+user.getUserId();*/
	}
	
	@RequestMapping( value="updateCompany", method=RequestMethod.GET )
	public String updateCompany( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateCompny : GET");
		//Business Logic
		User user = userService.getCompany(userId);

		model.addAttribute("user", user);
		
		return "forward:/view/user/updateCompany.jsp";
	}

	@RequestMapping( value="updateCompany", method=RequestMethod.POST )
	public String updateCompany( @ModelAttribute("user") User user , Model model , HttpSession session, @RequestParam("updateCompany") MultipartFile file) throws Exception{
		
		System.out.println("/user/updateCompany : POST");
		//Business Logic
		userService.updateCompany(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
			String image=file.getOriginalFilename();

			user.setImage(image);
			
			//user.setUserId("user");
	        try {
	            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
	            file.transferTo(uploadFile);
	        } catch (IOException e) {
	            e.printStackTrace();	
		}
		
	       return "forward:/view/user/getCompany.jsp";
	       
	}
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/view/user/loginView.jsp";
	}
	@RequestMapping( value="login", method=RequestMethod.POST )
	   public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
	      
	      System.out.println("/user/login : POST");

	      String destinate = "redirect:/user/login";
	      
	      User dbUser=userService.getUser(user.getUserId());
	      System.out.println("user 뭐닝" + dbUser);
	      
	      if( user.getPassword().equals(dbUser.getPassword())){
	         session.setAttribute("user", dbUser);
	         destinate="forward:/index.jsp";
	      }       
	      System.out.println(session.getAttribute("user"));
	      
	      return destinate;
//	      return "redirect:/user/getUser?userId="+dbUser.getUserId();
	   }
	/*@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		return "redirect:/index.jsp";
		//return "redirect:/index.jsp";
	}*/
	
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
	
	@RequestMapping( value="listCompany" )
	public String listCompany( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listCompany : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		Map<String , Object> map=userService.getCompanyList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/view/user/listCompany.jsp";
	}
	
	@RequestMapping( value="checkUserId/{userId}", method=RequestMethod.GET)
	   public void checkUserId(  @PathVariable String userId, Model model) throws Exception {
	      
	      System.out.println("/user/checkUserId : GET");
	      
	      boolean result = userService.checkUserId(userId);
	      
	      model.addAttribute("result", new Boolean(result));
	      
	   }
	
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public String deleteUser() throws Exception{
		
		System.out.println("/user/deleteUser : GET");

		return "redirect:/view/user/deleteUserView.jsp";
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.POST )
	   public String deleteUser(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
	      
	      System.out.println("/user/deleteUser : POST");

	      String destinate = "forward:/view/user/deleteUserView.jsp";
	      
	      User dbUser=userService.getUser(user.getUserId());
	      System.out.println("user" + dbUser);
	      
	      if( user.getPassword().equals(dbUser.getPassword())){
	         session.setAttribute("user", dbUser);
	         userService.deleteUser(user);
	         destinate="forward:/view/user/deleteUser.jsp";
	      }       
	      System.out.println(session.getAttribute("user"));
	      
	      return destinate;
//	      return "redirect:/user/getUser?userId="+dbUser.getUserId();
	   }
	/*@RequestMapping(value="deleteUser" , method=RequestMethod.POST)
	public String deleteUser(@RequestParam("password") String password,  HttpSession session) throws Exception{
		
		System.out.println("/user/deleteUser : POST");
		String userId= ((User)session.getAttribute("user")).getUserId();
		
		userService.deleteUser(userId , password);
		
		return "forward:/view/user/deleteUser.jsp";
	}*/
	
	
	
	
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