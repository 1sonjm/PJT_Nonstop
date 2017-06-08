package com.nonstop.service.project.projectImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
import com.nonstop.service.project.ProjectDAO;
import com.nonstop.service.project.ProjectService;


@Service("projectServiceImpl")
public class ProjectServiceImpl implements ProjectService{
	
	
	@Autowired
	@Qualifier("projectDAOImpl")
	private ProjectDAO projectDAO;
	
	public void setProjectDAO(ProjectDAO projectDAO){
		this.projectDAO = projectDAO;
	}
	
	public ProjectServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addProject(Project project) throws Exception {
		projectDAO.addProject(project);
	}

	
	
	public Project getProject(int projNo , String scrapUserId) throws Exception {
		
		return projectDAO.getProject(projNo ,scrapUserId);
	}

	public void updateProject(Project project) throws Exception {
		
		projectDAO.updateProject(project);
	}
	
	public void updateViewCount(Project project) throws Exception{
		
		projectDAO.updateViewCount(project);
	}
	
	
	public void deleteProject(Project project) throws Exception{
		
		projectDAO.deleteProject(project);
	}
	
	public List<Project> listProject(int projDivision, String scrapUserId, Search search, int sortFlag) throws Exception {
		Project project = new Project();
		String searchCondition = search.getSearchCondition();
		String searchKeyword = search.getSearchKeyword();
		
		List<Project> list = projectDAO.listProject(projDivision,scrapUserId,search,sortFlag);
		
		
		System.out.println("searchCondition서비스임플"+searchCondition);
		System.out.println("searchKeyword서비스임플"+searchKeyword);
		System.out.println("sortFlag"+ project.getSortFlag());
//		int totalCount = projectDAO.getTotalCount(search);
		
//		map.put("totalCount", new Integer(totalCount));
		
		return list;
	}
	
	@Override
	public void addComment(ProjComment projComment) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.addComment(projComment);
	}

	@Override
	public List<ProjComment> getCommentList(int comProjNo) throws Exception {
		// TODO Auto-generated method stub		
		return projectDAO.getCommentList(comProjNo);
	}

	@Override
	public ProjComment getComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.getComment(comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.deleteComment(comNo);
	}

	
	
	

}
