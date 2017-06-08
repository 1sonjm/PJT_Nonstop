package com.nonstop.control.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
import com.nonstop.domain.User;
import com.nonstop.service.profile.ProfileService;
import com.nonstop.service.project.ProjectService;
import com.nonstop.service.user.UserService;

//==> ȸ������ Controller
@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	///Field
	@Autowired
	@Qualifier("projectServiceImpl")
	private ProjectService projectService;
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method
	
	
	public ProjectController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int projPageSize;
	
	
	@RequestMapping(value="addProjectView", method=RequestMethod.GET)
	public String addProjectView() throws Exception {

		System.out.println("/view/project/addProjectView.jsp : GET");
		
		return "redirect:/view/project/addProjectView.jsp";
	}
	
	@RequestMapping(value="addProject", method=RequestMethod.POST)
	public String addProject( @ModelAttribute("project") Project project,  Model model, HttpSession session) throws Exception {
		
		System.out.println("여기는 addProject : "+project);
		System.out.println("sdfkjsdhalksdaf"+project.getProjAnnoEnd());
		System.out.println("sdfkjsdhalksdaf"+project.getProjStartDate());
		System.out.println("sdfkjsdhalksdaf"+project.getProjEndDate());
		projectService.addProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	
	@RequestMapping(value="getProject", method=RequestMethod.GET)
	public String getProject( @RequestParam("projNo") int projNo ,
							  Model model, HttpSession session ) throws Exception {
		
		System.out.println("/project/getProject : GET");
		
		
		Project project = new Project();
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		project = projectService.getProject(projNo ,scrapUserId);
		List<ProjComment> projCommentList = projectService.getCommentList(projNo);
		User user = userService.getUser(project.getProjUserId());
		projectService.updateViewCount(project);
		
		System.out.println(scrapUserId);
		
		
		session.setAttribute("projNo", projNo);
		model.addAttribute("projCommentList", projCommentList);
		model.addAttribute("project", project);
		model.addAttribute("user", user);
		
		return "forward:/view/project/getProject.jsp";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/*@RequestMapping(value="getJsonProduct/{prodNo}", method={RequestMethod.GET, RequestMethod.POST})
	public void getJsonProduct( @PathVariable int prodNo, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);
		
	}*/
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value="updateProjectView", method=RequestMethod.GET)
	public String updateProjectView( @RequestParam("projNo") int projNo , HttpSession session, Model model ) throws Exception{

		System.out.println("/view/project/updateProjectView.jsp : GET");
		//Business Logic
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		Project project = projectService.getProject(projNo, scrapUserId);
		// Model �� View ����
		model.addAttribute("project", project);
		
		return "forward:/view/project/updateProjectView.jsp";
	}
	
	@RequestMapping(value="updateProject", method=RequestMethod.POST)
	public String updateProject( @ModelAttribute("project") Project project , Model model , HttpSession session) throws Exception{

		System.out.println("/view/project/updateProject: POST");
		//Business Logic
			
		projectService.updateProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="deleteProject", method=RequestMethod.POST)
	public String deleteProject( @ModelAttribute("project") Project project, Model model ) throws Exception {

		projectService.deleteProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	
	@RequestMapping(value="listProject")
	public String listProject( @ModelAttribute("search") Search search,
								@RequestParam("sortFlag") int sortFlag , 
								@RequestParam("projDivision") int projDivision , 
								Model model ,HttpSession session , HttpServletRequest request) throws Exception{
		Project project = new Project();
		System.out.println("/project/listProject");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		System.out.println("sortFlag"+ sortFlag);
		search.setPageSize(projPageSize);
		String scrapUserId = "testUser";
		
		if((User)session.getAttribute("user") != null) {
			scrapUserId = ((User)session.getAttribute("user")).getUserId();		
		}
				
		List<Project> list = projectService.listProject(projDivision,scrapUserId,search,sortFlag);
		
		System.out.println("getSearchKeyword"+search.getSearchKeyword());
		System.out.println("getSearchCondition"+search.getSearchCondition());
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "forward:/view/project/listProject.jsp";
	}
	
	@RequestMapping(value={"addJsonComment"}, method=RequestMethod.POST)
	public void addJsonComment( @ModelAttribute("projComment") ProjComment projComment, HttpSession session, Model model ) throws Exception {
		
		System.out.println("/addJsonComment");
		
		System.out.println("projComment : "+projComment);
		
		projectService.addComment(projComment);
		
		projComment = projectService.getComment(projComment.getComNo());
		
		model.addAttribute("projComment", projComment);
	}
	
	@RequestMapping(value="deleteComment/{comNo}/{comProjNo}" , method=RequestMethod.GET)
	public void deleteComment(@PathVariable("comNo") int comNo, @PathVariable("comProjNo") int comProjNo, Model model) throws Exception{
		
		projectService.deleteComment(comNo);
		
	}
	
	
	
	
}