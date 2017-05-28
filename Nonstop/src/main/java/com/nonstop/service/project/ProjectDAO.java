package com.nonstop.service.project;

import java.util.List;

import com.nonstop.domain.Project;
import com.nonstop.domain.Search;


public interface ProjectDAO {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo) throws Exception;

	public List<Project> listProject(Search search) throws Exception;
//
	public void updateProject(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
//	
	public int getTotalCount(Search search) throws Exception ;
	
}