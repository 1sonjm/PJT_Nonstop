package com.nonstop.service.portfolio.portfolioImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.PortComment;
import com.nonstop.domain.PortImages;
import com.nonstop.domain.PortLike;
import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioDAO;
import com.nonstop.domain.Search;

@Repository("portfolioDAOImpl")
public class PortfolioDAOImpl  implements PortfolioDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PortfolioDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPortfolio(Portfolio portfolio) throws Exception {		
		
		sqlSession.insert("PortfolioMapper.addPortfolio", portfolio);
		
		List<PortImages> list = new ArrayList<PortImages>(portfolio.getImages());
		
		sqlSession.insert("PortfolioMapper.addPortImages", list);
	}
	
	@Override
	public Portfolio getPortfolio(int portNo,String sessionUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("portNo", portNo);
		map.put("sessionUserId", sessionUserId);
		
		return sqlSession.selectOne("PortfolioMapper.getPortfolio", map);
	}

	public List<Portfolio> getPortfolioList(Search search, String sessionUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("sessionUserId", sessionUserId);
		map.put("search", search);
		
		System.out.println(map);
		
		return sqlSession.selectList("PortfolioMapper.getPortfolioList", map);
	}
	
	@Override
	public List<Portfolio> getProfilePortList(String sessionUserId, String profileUserId) throws Exception {
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("sessionUserId", sessionUserId);
		map.put("profileUserId", profileUserId);
		
		return sqlSession.selectList("PortfolioMapper.getProfilePortList", map);
	}
	
	@Override
	public List<Portfolio> getProfilePortScrapList(String sessionUserId, String profileUserId) throws Exception {
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("sessionUserId", sessionUserId);
		map.put("profileUserId", profileUserId);
		
		return sqlSession.selectList("PortfolioMapper.getProfilePortScrapList", map);
	}

	@Override
	public void updatePortfolio(Portfolio portfolio) throws Exception {
		sqlSession.update("PortfolioMapper.updatePortfolio", portfolio);
	}

	@Override
	public int addComment(PortComment portComment) throws Exception {
		return sqlSession.insert("PortfolioMapper.addComment", portComment);		
	}

	@Override
	public List<PortComment> getCommentList(int comPortNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("PortfolioMapper.getCommentList", comPortNo);
	}

	@Override
	public PortComment getComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("PortfolioMapper.getComment", comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("PortfolioMapper.deleteComment", comNo);
	}

	@Override
	public void addPortLike(PortLike portLike) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("PortfolioMapper.addPortLike", portLike);
	}

	@Override
	public void deletePortLike(int portLikeNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("PortfolioMapper.deletePortLike", portLikeNo);
	}

	@Override
	public void updatePortCount(Portfolio portfolio) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("PortfolioMapper.updatePortCount", portfolio);
	}

	@Override
	public void deletePortfolio(int portNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("PortfolioMapper.deletePortfolio", portNo);
	}

}
