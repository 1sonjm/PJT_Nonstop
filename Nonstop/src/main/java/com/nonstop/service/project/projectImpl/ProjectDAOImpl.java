package com.nonstop.service.project.projectImpl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.ProjComment;
import com.nonstop.domain.Project;
import com.nonstop.domain.RecordApplicant;
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
	
	public void updateViewCount(Project project) throws Exception{
		
		sqlSession.update("ProjectMapper.updateViewCount", project);
	}
	
	public void deleteProject(Project project) throws Exception{
		
		sqlSession.delete("ProjectMapper.deleteProject", project);
	}

	
	public List<Project> getProjectList(Search search , String scrapUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("search", search);
		map.put("scrapUserId", scrapUserId);
		
		System.out.println("Asfsdfdsf"+map);
		return sqlSession.selectList("ProjectMapper.getProjectList", map);
	}
	
	@Override
	public int addComment(ProjComment projComment) throws Exception {
		return sqlSession.insert("ProjectMapper.addComment", projComment);		
	}

	@Override
	public List<ProjComment> getCommentList(int comProjNo) throws Exception {
		return sqlSession.selectList("ProjectMapper.getCommentList", comProjNo);
	}

	@Override
	public ProjComment getComment(int comNo) throws Exception {
		return sqlSession.selectOne("ProjectMapper.getComment", comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		sqlSession.delete("ProjectMapper.deleteComment", comNo);
	}

	@Override
	public void deleteCommentTotal(int comProjNo) throws Exception  {
		sqlSession.delete("ProjectMapper.deleteCommentTotal", comProjNo);
	}
	
	@Override
	public void addApplicant(int recProjNo, String recUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("recProjNo", recProjNo);
		map.put("recUserId", recUserId);
		sqlSession.insert("ProjectMapper.addApplicant", map);
	}
	
	public RecordApplicant getApplicant(int recProjNo, String recUserId) throws Exception{
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("recProjNo", recProjNo);
		map.put("recUserId", recUserId);
		
		return sqlSession.selectOne("ProjectMapper.getApplicant", map);
	}
	
	public List<RecordApplicant> getApplicantList(int recProjNo) throws Exception{
		
		return sqlSession.selectList("ProjectMapper.getApplicantList", recProjNo);
	}
	
	public void deleteApplicant(int recProjNo, String recUserId) throws Exception{
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("recProjNo", recProjNo);
		map.put("recUserId", recUserId);
		
		sqlSession.delete("ProjectMapper.deleteApplicant", map);
	}
	
	public void inviteApplicant(int recNo) throws Exception{
		
		sqlSession.update("ProjectMapper.inviteApplicant", recNo);
		
	}
	
	public void deleteApplicantTotal(int recProjNo) throws Exception{
		sqlSession.delete("ProjectMapper.deleteApplicantTotal", recProjNo);
	}
}
	
