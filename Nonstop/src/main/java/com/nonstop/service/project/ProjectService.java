package com.nonstop.service.project;

import com.nonstop.domain.Project;


public interface ProjectService {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo) throws Exception;

//	public Map<String,Object> getProductList(Search search) throws Exception;
//
	public void updateProject(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
	
}