package com.nonstop.service.project;

import java.util.List;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.RecordApplicant;
import com.nonstop.domain.Search;
import com.nonstop.domain.TechUse;


public interface ProjectService {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo , String scrapUserId) throws Exception;

	public List<Project> getProjectList(Search search , String scrapUserId) throws Exception;

	public void updateProject(Project project) throws Exception;
	
	public void updateViewCount(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
	
	public void addComment(ProjComment projComment) throws Exception ;

	public List<ProjComment> getCommentList(int comProjNo) throws Exception ;

	public ProjComment getComment(int comNo) throws Exception;

	public void deleteComment(int comNo) throws Exception ;
	
	public void deleteCommentTotal(int comProjNo) throws Exception ;
	
	public void addApplicant(int recProjNo, String recUserId) throws Exception ;

	public RecordApplicant getApplicant(int recProjNo, String recUserId) throws Exception ;
	
	public List<RecordApplicant> getApplicantList(int recProjNo) throws Exception;
	
	public void inviteApplicant(int recNo) throws Exception;
	
	public void deleteApplicant(int recProjNo, String recUserId) throws Exception;
	
	public void deleteApplicantTotal(int recProjNo) throws Exception;

	public List<Project> listProject(int projDivision, String sessionId, Search search2, int sortFlag);
	
}