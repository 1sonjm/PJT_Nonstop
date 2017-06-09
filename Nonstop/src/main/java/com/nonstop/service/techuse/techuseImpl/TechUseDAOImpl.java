package com.nonstop.service.techuse.techuseImpl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Tech;
import com.nonstop.domain.TechUse;
import com.nonstop.service.techuse.TechUseDAO;




@Repository("techUseDAOImpl")
public class TechUseDAOImpl implements TechUseDAO{
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public TechUseDAOImpl() {
		System.out.println(this.getClass());
	}
	
	public void addTechUse(TechUse techUse) throws Exception {
		
		sqlSession.insert("TechUseMapper.addTechUse", techUse);
		
	}

//	public List<TechUse> getTechUse(int techNo) throws Exception{
//		
//		Map<String , Object> map = new HashMap<String , Object>();
//		
//		map.put("techNo", techNo);
//		
//		return sqlSession.selectOne("TechUseMapper.getTechUse", map);
//	}
	
	public TechUse getTechUse(int tuNo) throws Exception{
		
		return sqlSession.selectOne("TechUseMapper.getTechUse", tuNo);
	}
	
	public void updateTechUse(TechUse techUse) throws Exception {
		
		sqlSession.update("TechUseMapper.updateTechUse", techUse);
		
	}
	
	public List<TechUse> listTechUse(int tuProjNo) throws Exception {
		
		return sqlSession.selectList("TechUseMapper.listTechUse", tuProjNo);
	}
	
	public void deleteTechUse(TechUse techUse) throws Exception{
		
		sqlSession.delete("TechUseMapper.deleteTechUse", techUse);
	}

	
	/*@Override
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
	}*/

}
