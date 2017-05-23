package com.nonstop.service.project;

import com.nonstop.domain.Project;


public interface ProjectDAO {
	
//	public void addProduct(Product product) throws Exception;

	public Project getProject(int projNo) throws Exception;

//	public List<Product> getProductList(Search search) throws Exception;
//
//	public void updateProduct(Product product) throws Exception;
//	
//	public int getTotalCount(Search search) throws Exception ;
	
}