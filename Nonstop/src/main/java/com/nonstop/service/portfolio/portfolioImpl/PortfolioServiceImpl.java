package com.nonstop.service.portfolio.portfolioImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.PortComment;
import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioDAO;
import com.nonstop.service.portfolio.PortfolioService;

@Service("portfolioServiceImpl")
public class PortfolioServiceImpl implements PortfolioService{

	@Autowired
	@Qualifier("portfolioDAOImpl")
	private PortfolioDAO portfolioDAO;

	public void setPortfolioDAO(PortfolioDAO portfolioDAO) {
		this.portfolioDAO = portfolioDAO;
	}

	public PortfolioServiceImpl() {

	}

	@Override
	public void addPortfolio(Portfolio portfolio) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.addPortfolio(portfolio);
	}

	@Override
	public Portfolio getPortfolio(int portNo , String scrapUserId) throws Exception {
		// TODO Auto-generated method stub
		return portfolioDAO.getPortfolio(portNo,scrapUserId);
	}

	@Override
	public List<Portfolio> getPortfolioList(int portDivision, String scrapUserId) throws Exception {
		List<Portfolio> portfolioList = portfolioDAO.getPortfolioList(portDivision,scrapUserId);
		return portfolioList;
	}

	@Override
	public void updatePortfolio(Portfolio portfolio) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.updatePortfolio(portfolio);
	}

	@Override
	public void addComment(PortComment portComment) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.addComment(portComment);
	}

	@Override
	public List<PortComment> getCommentList(int comPortNo) throws Exception {
		// TODO Auto-generated method stub		
		return portfolioDAO.getCommentList(comPortNo);
	}

	@Override
	public PortComment getComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		return portfolioDAO.getComment(comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.deleteComment(comNo);
	}
	
	
	
}
