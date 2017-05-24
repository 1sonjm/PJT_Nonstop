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
	
	public void addProject(Project project) throws Exception {
		
		sqlSession.insert("ProjectMapper.addProject", project);
		
	}

		
	public Project getProject(int projNo) throws Exception {
//		int comProdNo = prodNo;
//		sqlSession.selectOne("CommentMapper.getComment", comProdNo);
		return sqlSession.selectOne("ProjectMapper.getProject", projNo);
	}
	
	public void updateProject(Project project) throws Exception {
		
		sqlSession.update("ProjectMapper.updateProject", project);
		
	}
	
	public void deleteProject(Project project) throws Exception{
		
		sqlSession.delete("ProjectMapper.deleteProject", project);
	}

	
/*	public List<Product> getProductList(Search search) throws Exception {
		
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	
	
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
*/
}
