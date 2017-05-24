package com.nonstop.service.project;

import com.nonstop.domain.Project;


public interface ProjectDAO {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo) throws Exception;

//	public List<Product> getProductList(Search search) throws Exception;
//
	public void updateProject(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
//	
//	public int getTotalCount(Search search) throws Exception ;
	
}