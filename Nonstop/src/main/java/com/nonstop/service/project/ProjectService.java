package com.nonstop.service.project;

import java.util.Map;

import com.nonstop.domain.Project;
import com.nonstop.domain.Search;


public interface ProjectService {
	
	public void addProject(Project project) throws Exception;

	public Project getProject(int projNo , String scrapUserId) throws Exception;

	public Map<String,Object> listProject(Search search , String scrapUserId) throws Exception;

	public void updateProject(Project project) throws Exception;
	
	public void deleteProject(Project project) throws Exception;
	
}