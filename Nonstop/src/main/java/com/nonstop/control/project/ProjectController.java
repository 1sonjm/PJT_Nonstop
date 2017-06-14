package com.nonstop.control.project;

import java.util.ArrayList;
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
import com.nonstop.domain.RecordApplicant;
import com.nonstop.domain.Search;
import com.nonstop.domain.Tech;
import com.nonstop.domain.TechUse;
import com.nonstop.domain.User;
import com.nonstop.service.profile.ProfileService;
import com.nonstop.service.project.ProjectService;
import com.nonstop.service.techuse.TechUseService;
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
	
	@Autowired
	@Qualifier("techUseServiceImpl")
	private TechUseService techUseService;
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
	public String addProject( @ModelAttribute("project") Project project,  
							  @ModelAttribute("techUse") TechUse techUse, 
							  @RequestParam("checkBoxes") int [] items,
							  Model model, HttpSession session) throws Exception {
		
		int [] tuTechNo = items;
		
		projectService.addProject(project);
//		
		int tuProjNo = project.getProjNo();
		
		if(tuTechNo.length > 0){
			for(int i=0; i<tuTechNo.length;i++){
				techUseService.addTechUse(tuTechNo[i], tuProjNo);
			}
		}
		model.addAttribute("project", project);
		model.addAttribute("techUse", techUse);
		
		return "forward:/index.jsp";
	}
	
	
	@RequestMapping(value="getProject", method=RequestMethod.GET)
	public String getProject( @ModelAttribute("recordApplicant") RecordApplicant recordApplicant,
			     			  @RequestParam("projNo") int projNo ,
							  Model model, HttpSession session ) throws Exception {
		
		System.out.println("/project/getProject : GET");
		
		
		Project project = new Project();
	
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		project = projectService.getProject(projNo ,scrapUserId);
		List<ProjComment> projCommentList = projectService.getCommentList(projNo);
		List<TechUse> listTechUse = techUseService.getTechUseList(projNo);
		User user = userService.getUser(project.getProjUserId());
		recordApplicant = projectService.getApplicant(projNo, scrapUserId);
		projectService.updateViewCount(project);
		List<RecordApplicant> listApplicant = projectService.getApplicantList(projNo);
		
		System.out.println("listApplicant="+listApplicant);
		
		
		session.setAttribute("projNo", projNo);
		model.addAttribute("projCommentList", projCommentList);
		model.addAttribute("listTechUse", listTechUse);
		model.addAttribute("project", project);
		model.addAttribute("user", user);
		model.addAttribute("recordApplicant", recordApplicant);
		model.addAttribute("listApplicant", listApplicant);
		
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
	public String updateProject( @ModelAttribute("project") Project project , 
								 @ModelAttribute("techUse") TechUse techUse , 
								 @RequestParam("checkBoxes") int [] items,
								 Model model , HttpSession session) throws Exception{

		System.out.println("/view/project/updateProject: POST");
		
		int tuProjNo = project.getProjNo();
		techUseService.deleteTechUse(tuProjNo);
		
		int [] tuTechNo = items;
		
		if(tuTechNo.length > 0){
			for(int i=0; i<tuTechNo.length;i++){
				techUseService.addTechUse(tuTechNo[i], tuProjNo);
				System.out.println(tuTechNo[i]);
			}
		}
		
		projectService.updateProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="deleteProject", method=RequestMethod.POST)
	public String deleteProject( @ModelAttribute("project") Project project, Model model ) throws Exception {
		
		int projNo = project.getProjNo();
		techUseService.deleteTechUse(projNo);
		
		projectService.deleteCommentTotal(projNo);
		
		projectService.deleteApplicantTotal(projNo);
		
		projectService.deleteProject(project);
		
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	
	@RequestMapping(value="listProject")
	public String listProject( @ModelAttribute("search") Search search,
							   Model model ,HttpSession session , HttpServletRequest request) throws Exception{
		System.out.println("/project/listProject");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(projPageSize);
		String scrapUserId = "testUser";
		
		
		if((User)session.getAttribute("user") != null) {
			scrapUserId = ((User)session.getAttribute("user")).getUserId();		
		}
		
		List<Project> list = projectService.getProjectList(search, scrapUserId);
        
        //search.postDivision의 맨 앞글자가 1이면 개발 전체, 2이면 디자인 전체로 세팅
        String postDivision = String.valueOf(search.getPostDivision());
		
		if(postDivision.startsWith("1")){
			search.setPostDivision(1);
		}else{
			search.setPostDivision(2);
		}
		//추천순으로 나열
		search.setPostSorting(3);
		
		List<Integer> projNoList = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			projNoList.add(list.get(i).getProjNo());
	    }
		List<TechUse> listTechUse = techUseService.listTechUse(projNoList);
        
        
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("listTechUse", listTechUse);
		
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
	
	@RequestMapping(value="addApplicant" , method=RequestMethod.POST)
	public String addApplicant(@ModelAttribute("recordApplicant") RecordApplicant recordApplicant,
							   @RequestParam("projNo") int projNo,
							   HttpSession session, Model model) throws Exception{
		
		int recProjNo = projNo;
		String recUserId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("recProjNo="+recProjNo);
		System.out.println("recUserId="+recUserId);
		
		projectService.addApplicant(recProjNo, recUserId);
		
		model.addAttribute("recordApplicant", recordApplicant);
		
		return "forward:/index.jsp";
		
	}
	
	@RequestMapping(value="listApplicant")
	public String listProject( @ModelAttribute("recordApplicant") RecordApplicant recordApplicant,
							   @RequestParam("projNo") int recProjNo,
							   Model model ,HttpSession session , HttpServletRequest request) throws Exception{
		System.out.println("/project/listApplicant");
		
		List<RecordApplicant> listApplicant = projectService.getApplicantList(recProjNo);
        
		model.addAttribute("listApplicant", listApplicant);
		
		return "forward:/view/project/getProject.jsp";
	}
	
	@RequestMapping(value="inviteApplicant", method=RequestMethod.POST)
	public String inviteApplicant( @ModelAttribute("recordApplicant") RecordApplicant recordApplicant,
								   @RequestParam("checkBoxes") int [] items,
								   Model model , HttpSession session) throws Exception{

		System.out.println("/view/project/inviteProject: POST");
		
		int [] recNo = items;
		
		if(recNo.length > 0){
			for(int i=0; i<recNo.length;i++){
				projectService.inviteApplicant(recNo[i]);
			}
		}
		
		model.addAttribute("recordApplicant", recordApplicant);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value="deleteApplicant", method=RequestMethod.POST)
	public String deleteApplicant( @ModelAttribute("recordApplicant") RecordApplicant recordApplicant,
								   @ModelAttribute("project") Project project, 
								   HttpSession session, Model model ) throws Exception {
		int recProjNo = project.getProjNo();	
		String recUserId = ((User)session.getAttribute("user")).getUserId();
		projectService.deleteApplicant(recProjNo, recUserId);
		
		model.addAttribute("recordApplicant", recordApplicant);
		model.addAttribute("project", project);
		
		return "forward:/index.jsp";
	}
	
	
}