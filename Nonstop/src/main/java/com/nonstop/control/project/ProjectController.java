package com.nonstop.control.project;

import java.util.Map;

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

import com.nonstop.domain.Page;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
import com.nonstop.service.project.ProjectService;

//==> ȸ������ Controller
@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	///Field
	@Autowired
	@Qualifier("projectServiceImpl")
	private ProjectService projectService;
	
	/*@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;*/
	
	/*@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method
	*/
	
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
	public String addProject( @ModelAttribute("project") Project project, Model model) throws Exception {
		
		System.out.println("여기는 addProject : "+project);
		
		projectService.addProject(project);
		model.addAttribute("project", project);
		
		return "forward:/view/project/listProject.jsp";
	}
	
	
	@RequestMapping(value="getProject", method=RequestMethod.GET)
	public String getProduct( @RequestParam("projNo") int projNo , 
							  Model model, HttpSession session ) throws Exception {
		
		System.out.println("/project/getProject : GET");
//	int comProdNo=prodNo;
		Project project = projectService.getProject(projNo);
//		Comment comment = commentService.getComment(product.getProdNo());
		
//		session.setAttribute("comProdNo", comProdNo);
		session.setAttribute("projNo", projNo);
//		model.addAttribute("comProdNo", comProdNo);
		model.addAttribute("project", project);
//		model.addAttribute("comment", comment);
		
	
		return "forward:/view/project/listProject.jsp";
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
	public String updateProjectView( @RequestParam("projNo") int projNo , Model model ) throws Exception{

		System.out.println("/view/project/updateProjectView.jsp : GET");
		//Business Logic
		Project project = projectService.getProject(projNo);
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
		
		
		return "forward:/view/project/listProject.jsp";
	}
	
	@RequestMapping(value="deleteProject", method=RequestMethod.POST)
	public String deleteProject( @ModelAttribute("project") Project project, Model model ) throws Exception {

		projectService.deleteProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/view/project/listProject.jsp";
	}
	
	
	@RequestMapping(value="listProject")
	public String listProject( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/project/listProject");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=projectService.listProject(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/view/project/listProject.jsp";
	}
	/*
	@RequestMapping(value="addComment", method=RequestMethod.POST)
	public String addComment( @ModelAttribute("comment") Comment comment, Model model) throws Exception {
		
		System.out.println("����� addComment : "+comment);
		
		commentService.addComment(comment);
		model.addAttribute("comment", comment);
		
		return "redirect:/product/listProduct?menu=search";
	}
	
	@RequestMapping(value="getComment", method=RequestMethod.GET)
	public String getComment( @RequestParam("comNo") int comNo, Model model, HttpSession session ) throws Exception {
		
		System.out.println("/comment/getComment : GET");
		Comment comment = commentService.getComment(comNo);
		session.setAttribute("comNo", comNo);
		model.addAttribute("comNo", comNo);
		
		System.out.println("GetProductAction��2");
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="deleteComment", method=RequestMethod.POST)
	public String deleteComment( @ModelAttribute("comment") Comment comment, Model model ) throws Exception {

		commentService.deleteComment(comment);
		model.addAttribute("comment", comment);
		
		return "redirect:/product/listProduct?menu=search";
	}
	
	
	*/

	
	
}