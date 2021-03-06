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
	
	public void addTechUse(int tuTechNo, int tuProjNo) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("tuTechNo", tuTechNo);
		map.put("tuProjNo", tuProjNo);
		
		sqlSession.insert("TechUseMapper.addTechUse", map);
		
	}
	
	public void addTechUsePort(int tuTechNo, int tuPortNo) throws Exception { 
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("tuTechNo", tuTechNo);
		map.put("tuPortNo", tuPortNo);
		
		sqlSession.insert("TechUseMapper.addTechUsePort", map);
	}
	
	public TechUse getTechUse(int tuNo) throws Exception{
		
		return sqlSession.selectOne("TechUseMapper.getTechUse", tuNo);
	}
	
	public void updateTechUse(TechUse techUse) throws Exception {
		
		sqlSession.update("TechUseMapper.updateTechUse", techUse);
		
	}
	
	public List<TechUse> getTechUseList(int tuProjNo) throws Exception {
		
		return sqlSession.selectList("TechUseMapper.getTechUseList", tuProjNo);
	}
	
	public void deleteTechUse(int tuProjNo) throws Exception{
		
		sqlSession.delete("TechUseMapper.deleteTechUse", tuProjNo);
	}
	
	public void deleteTechUsePort(int tuPortNo) throws Exception{
		sqlSession.delete("TechUseMapper.deleteTechUsePort", tuPortNo);
	}

	@Override
	public List<TechUse> listTechUse(List<Integer> projNoList) throws Exception {
		return sqlSession.selectList("TechUseMapper.listTechUse", projNoList);
	}


}
