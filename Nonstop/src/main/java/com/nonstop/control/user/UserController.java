package com.nonstop.control.user;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
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
	

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;



		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser( ) throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/view/user/addUserView.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user,@RequestParam("file") MultipartFile file, Model model) throws Exception {

		System.out.println("/user/addUser : POST");
		
		String image=file.getOriginalFilename();

		user.setImage(image);
		
		
        try {
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
		userService.addUser(user);
		
		return "redirect:/index.jsp";
	}
	
	
	
   @RequestMapping( value="addUser/{userId}", method=RequestMethod.POST)
   public void addUser( @PathVariable String userId) throws Exception{
   
      System.out.println("/user/addUser : json");
      userId = userId.replace(",", ".");
      
   }
   
   @RequestMapping( value="addJsonUser/{userId}", method=RequestMethod.GET )
   public String addJsonUser( @PathVariable String userId , Model model) throws Exception {

      System.out.println("/user/addJsonUser : GET");
      //Business Logic
      //userService.addJsonUser(userId);
      
      userId=userId.replace(",", ".");
      model.addAttribute("userId",userId);
      
      return "forward:/user/addUserView.jsp";
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
		
		
        try {
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
		userService.addCompany(user);

		return "redirect:/index.jsp";
	}
	

	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		
		User user = userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/view/user/getUser.jsp";
	}
	

	@RequestMapping( value="getJsonUser/{userId}", method=RequestMethod.GET )
	public void getJsonUser(	@PathVariable String userId, 
									 			Model model) throws Exception{
		
		System.out.println("/getJsonUser/getUser : GET");
		
		User user = userService.getUser(userId);

	

		model.addAttribute("user", user);
	}
	
	@RequestMapping( value="getCompany", method=RequestMethod.GET )
	public String getCompany( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getCompany : GET");
		
		User user = userService.getCompany(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/view/user/getCompany.jsp";
	}
	
	
	@RequestMapping( value="getJsonCompany/{userId}", method=RequestMethod.GET )
	public void getJsonCompany(	@PathVariable String userId, 
									 			Model model) throws Exception{
		
		System.out.println("/getJson/getCompany : GET");
		
		User user = userService.getCompany(userId);
		
		model.addAttribute("user", user);
	}

	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		
		User user = userService.getUser(userId);

		model.addAttribute("user", user);
		
		return "forward:/view/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session, @RequestParam("updateFile") MultipartFile file) throws Exception{
		
		System.out.println("/user/updateUser : POST");
		
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
			String image=file.getOriginalFilename();

			user.setImage(image);
			
			
	        try {
	            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + image);
	            file.transferTo(uploadFile);
	        } catch (IOException e) {
	            e.printStackTrace();	
		}
  
	        return "forward:/view/user/getUser.jsp";
		
	}
	
	@RequestMapping( value="updateCompany", method=RequestMethod.GET )
	public String updateCompany( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateCompny : GET");
		
		User user = userService.getCompany(userId);

		model.addAttribute("user", user);
		
		return "forward:/view/user/updateCompany.jsp";
	}

	@RequestMapping( value="updateCompany", method=RequestMethod.POST )
	public String updateCompany( @ModelAttribute("user") User user , Model model , HttpSession session, @RequestParam("updateCompany") MultipartFile file) throws Exception{
		
		System.out.println("/user/updateCompany : POST");
		
		userService.updateCompany(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
			String image=file.getOriginalFilename();

			user.setImage(image);
			
			
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

	   }
	
	@RequestMapping( value="jsonLogin", method=RequestMethod.POST )
	public void jsonLogin(	@RequestBody User user,
												HttpSession session,
												Model model) throws Exception{
	
		System.out.println("/user/jsonLogin : POST");
		
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());

		if( dbUser != null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			model.addAttribute("user", dbUser);
		}else{
			model.addAttribute("user", null);
		}
	}
	
	
	
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

	@RequestMapping( value="checkUserId/{userId}", method=RequestMethod.POST)
	   public String checkUserId(  @PathVariable String userId, Model model , HttpSession session) throws Exception {
	      
	      System.out.println("/user/checkUserId : GET");
	      userId=userId.replace(",", ".");
	      System.out.println("userId :: " + userId);
	      User user = userService.checkUserId(userId);
	      
	      model.addAttribute("user", user);
	      
	      System.out.println("/user/login : POST");
	      session.setAttribute("user", user);
	      
	     
	      
	         return "forward:/index.jsp";
	   }
	
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public String deleteUser(@RequestParam("userId") String userId,Model model) throws Exception{
		
		System.out.println("/user/deleteUser : GET");
		
		User user = userService.getUser(userId);
		
		model.addAttribute("user" , user);

		return "forward:/view/user/deleteUserView.jsp";
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.POST )
		 public String deleteUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{
	      System.out.println("/user/deleteUser : POST");
	    
			
			userService.deleteUser(user);
			
			String sessionId=((User)session.getAttribute("user")).getUserId();
			if(sessionId.equals(user.getUserId())){
				session.setAttribute("user", user);
			}
	      String destinate = "forward:/view/user/deleteUserView.jsp";
	      
	     
	      userService.deleteUser(user);
			
			String sessionId1=((User)session.getAttribute("user")).getUserId();
			if(sessionId1.equals(user.getUserId())){
				session.setAttribute("user", user);
			}
			
	      if( user.getPassword().equals(user.getPassword())){
	         session.setAttribute("user", user);
	         userService.deleteUser(user);
	         session.invalidate();
	         destinate="forward:/view/user/deleteUser.jsp";
	      }       
	     
	      
	      return destinate;

	   }
	
	@RequestMapping( value="logink", method=RequestMethod.POST )
	   public String logink(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
	      
	      System.out.println("/user/login : POST");

	      String destinate = "forward:/index.jsp";
	      
	      User dbUser=userService.getUser(user.getUserId());
	      System.out.println("user 뭐닝" + dbUser);
	         session.setAttribute("user", dbUser);
	         return destinate="forward:/index.jsp";
	      }

	
	
	
	
	
	
	
	
}