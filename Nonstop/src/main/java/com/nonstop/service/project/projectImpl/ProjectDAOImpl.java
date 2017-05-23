package com.nonstop.service.project.projectImpl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Project;
import com.nonstop.service.project.ProjectDAO;




@Repository("projectDAOImpl")
public class ProjectDAOImpl implements ProjectDAO{
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ProjectDAOImpl() {
		System.out.println(this.getClass());
	}
	
	/*public void addProduct(Product product) throws Exception {
		String manuDate=product.getManuDate().replace("-", "");
		product.setManuDate(manuDate);
		
		sqlSession.insert("ProductMapper.addProduct", product);
		
	}
*/
		
	public Project getProject(int projNo) throws Exception {
//		int comProdNo = prodNo;
//		sqlSession.selectOne("CommentMapper.getComment", comProdNo);
		return sqlSession.selectOne("ProjectMapper.getProject", projNo);
	}

	
/*	public List<Product> getProductList(Search search) throws Exception {
		
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	
	public void updateProduct(Product product) throws Exception {
		
		String manuDate=product.getManuDate().replace("-", "");
		product.setManuDate(manuDate);
		sqlSession.update("ProductMapper.updateProduct", product);
		
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
*/
}
