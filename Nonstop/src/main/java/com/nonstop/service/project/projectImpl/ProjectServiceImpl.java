package com.nonstop.service.project.projectImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.RecordApplicant;
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
		
		List<Project> list = projectDAO.listProject(projDivision,scrapUserId,search,sortFlag);
		return list;
	}
	
	@Override
	public void addComment(ProjComment projComment) throws Exception {
		projectDAO.addComment(projComment);
	}

	@Override
	public List<ProjComment> getCommentList(int comProjNo) throws Exception {
		return projectDAO.getCommentList(comProjNo);
	}

	@Override
	public ProjComment getComment(int comNo) throws Exception {
		return projectDAO.getComment(comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		projectDAO.deleteComment(comNo);
	}

	@Override
	public void deleteCommentTotal(int comProjNo) throws Exception {
		projectDAO.deleteCommentTotal(comProjNo);
	}
	
	@Override
	public void addApplicant(int recProjNo, String recUserId) throws Exception{
		projectDAO.addApplicant(recProjNo, recUserId);
	}
	
	@Override
	public RecordApplicant getApplicant(int recProjNo, String recUserId) throws Exception {
		return projectDAO.getApplicant(recProjNo, recUserId);
	}
	
	@Override
	public List<RecordApplicant> getApplicantList(List<Integer> projNoList) throws Exception {
		return projectDAO.getApplicantList(projNoList);
	}
	
	@Override
	public void deleteApplicant(int recProjNo, String recUserId) throws Exception{
		
		projectDAO.deleteApplicant(recProjNo, recUserId);
	}
	
	@Override
	public void deleteApplicantTotal(int recProjNo) throws Exception{
		
		projectDAO.deleteApplicantTotal(recProjNo);
	}
}
