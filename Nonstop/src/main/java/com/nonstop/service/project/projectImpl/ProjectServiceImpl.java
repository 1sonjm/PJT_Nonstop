package com.nonstop.service.project.projectImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	
	/*public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
	}

	*/
	
	public Project getProject(int projNo) throws Exception {
		
		return projectDAO.getProject(projNo);
	}

	
	/*public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	
	public void updateProduct(Product product) throws Exception {
		
		productDao.updateProduct(product);
	}*/
	

}
