package com.nonstop.service.project.projectImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
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
	
	public void deleteProject(Project project) throws Exception{
		
		projectDAO.deleteProject(project);
	}
	
	public List<Project> listProject(int projDivision, String scrapUserId) throws Exception {
		List<Project> list = projectDAO.listProject(projDivision,scrapUserId);
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
