package com.nonstop.service.project.projectImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	
	public void deleteProject(Project project) throws Exception{
		
		projectDAO.deleteProject(project);
	}
	
	public Map<String, Object> listProject(Search search , String scrapUserId) throws Exception {
		List<Project> list = projectDAO.listProject(search,scrapUserId);
		int totalCount = projectDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	
	
	

}
