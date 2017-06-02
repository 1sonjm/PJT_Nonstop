package com.nonstop.service.project.projectImpl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
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

		
	public Project getProject(int projNo , String scrapUserId) throws Exception {
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("projNo", projNo);
		map.put("scrapUserId", scrapUserId);
		
		return sqlSession.selectOne("ProjectMapper.getProject", map);
	}
	
	public void updateProject(Project project) throws Exception {
		
		sqlSession.update("ProjectMapper.updateProject", project);
		
	}
	
	public void deleteProject(Project project) throws Exception{
		
		sqlSession.delete("ProjectMapper.deleteProject", project);
	}

	
	public List<Project> listProject(int projDivision , String scrapUserId) throws Exception {
		
		//Map<String , Object> map = new HashMap<String , Object>();
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("scrapUserId", scrapUserId);
		map.put("projDivision", projDivision);
		
		//map.put("search", search);
		//map.put("scrapUserId", scrapUserId);
		
		return sqlSession.selectList("ProjectMapper.listProject", map);
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProjectMapper.getTotalCount", search);
	}
	
	@Override
	public int addComment(ProjComment projComment) throws Exception {
		return sqlSession.insert("ProjectMapper.addComment", projComment);		
	}

	@Override
	public List<ProjComment> getCommentList(int comProjNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ProjectMapper.getCommentList", comProjNo);
	}

	@Override
	public ProjComment getComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProjectMapper.getComment", comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("ProjectMapper.deleteComment", comNo);
	}

}
