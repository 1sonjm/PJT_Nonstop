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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.User;
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
	int pageSize;
	
	
	@RequestMapping(value="addProjectView", method=RequestMethod.GET)
	public String addProjectView() throws Exception {

		System.out.println("/view/project/addProjectView.jsp : GET");
		
		return "redirect:/view/project/addProjectView.jsp";
	}
	
	@RequestMapping(value="addProject", method=RequestMethod.POST)
	public String addProject( @ModelAttribute("project") Project project,  Model model, HttpSession session) throws Exception {
		
		System.out.println("여기는 addProject : "+project);
		
//		projDetail.replaceAll("\r\n", "<br>");
//		session.setAttribute("projDetail", projDetail);
		projectService.addProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/project/listProject";
	}
	
	
	@RequestMapping(value="getProject", method=RequestMethod.GET)
	public String getProject( @RequestParam("projNo") int projNo ,
							  Model model, HttpSession session ) throws Exception {
		
		System.out.println("/project/getProject : GET");
		
		Project project = new Project();
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
//		String projDetail = project.getProjDetail();
		
//		Project project = projectService.getProject(projNo);
		project = projectService.getProject(projNo ,scrapUserId);
//		Comment comment = commentService.getComment(project.getProjNo());
		User user = userService.getUser(project.getProjUserId());
		
//		project.getProjDetail().replaceAll("\r\n", "<br>");
		
		System.out.println(scrapUserId);
		
		
//		session.setAttribute("comProdNo", comProdNo);
		session.setAttribute("projNo", projNo);
//		model.addAttribute("comProdNo", comProdNo);
		model.addAttribute("project", project);
//		model.addAttribute("comment", comment);
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
		
		return "forward:/project/listProject";
	}
	
	@RequestMapping(value="deleteProject", method=RequestMethod.POST)
	public String deleteProject( @ModelAttribute("project") Project project, Model model ) throws Exception {

		projectService.deleteProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/project/listProject";
	}
	
	
	@RequestMapping(value="listProject")
	public String listProject( @RequestParam("projDivision") int projDivision , Model model ,HttpSession session , HttpServletRequest request) throws Exception{
		
		System.out.println("/project/listProject");
		Project project = new Project();
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		User user = userService.getUser(project.getProjUserId());
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		// Business logic ����
//		Map<String , Object> map=projectService.listProject(projDivision,scrapUserId);
		List<Project> list = projectService.listProject(projDivision,scrapUserId);
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
		
		model.addAttribute("list", list);
//		model.addAttribute("user", user);
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
		
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
	
	@RequestMapping(value="deleteComment")
	public String deleteComment(@RequestParam("comNo") int comNo, @RequestParam("comProjNo") int comProjNo, Model model) throws Exception{
		
		projectService.deleteComment(comNo);
		/*AJAX로 삭제하는 법 고려해보기*/
		/*List<PortComment> portCommentList = portfolioService.getCommentList(comPortNo);*/
		
		return "forward:/portfolio/getPortfolio?projNo="+comProjNo;
	}
	
	
	
	
}