package com.nonstop.service.portfolio.portfolioImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioDAO;

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
	}
	
	@Override
	public Portfolio getPortfolio(int portNo,String scrapUserId) throws Exception {

		System.out.println("포트폴리오 디에오임쁠 여기들어오냣!");
		System.out.println(portNo);
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("portNo", portNo);
		map.put("scrapUserId", scrapUserId);
		
		return sqlSession.selectOne("PortfolioMapper.getPortfolio", map);
	}

	public List<Portfolio> getPortfolioList(int portDivision,String scrapUserId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("scrapUserId", scrapUserId);
		map.put("portDivision", portDivision);
		
		
		return sqlSession.selectList("PortfolioMapper.getPortfolioList", map);
	}

	@Override
	public void updatePortfolio(Portfolio portfolio) throws Exception {
		sqlSession.update("PortfolioMapper.updatePortfolio", portfolio);
	}
	
}
