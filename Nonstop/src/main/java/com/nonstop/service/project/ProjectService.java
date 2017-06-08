package com.nonstop.service.project;

import java.util.List;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;


public interface ProjectService {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo , String scrapUserId) throws Exception;

	public List<Project> listProject(int projDivision , String scrapUserId, Search search, int sortFlag) throws Exception;

	public void updateProject(Project project) throws Exception;
	
	public void updateViewCount(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
	
	public void addComment(ProjComment projComment) throws Exception ;

	public List<ProjComment> getCommentList(int comProjNo) throws Exception ;

	public ProjComment getComment(int comNo) throws Exception;

	public void deleteComment(int comNo) throws Exception ;
	
	
	
}