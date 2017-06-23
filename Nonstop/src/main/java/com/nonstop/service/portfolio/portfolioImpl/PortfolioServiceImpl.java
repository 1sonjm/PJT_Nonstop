package com.nonstop.service.portfolio.portfolioImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.PortComment;
import com.nonstop.domain.PortLike;
import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioDAO;
import com.nonstop.service.portfolio.PortfolioService;
import com.nonstop.domain.Search;

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
	public int addPortfolio(Portfolio portfolio) throws Exception {
		// TODO Auto-generated method stub
		return portfolioDAO.addPortfolio(portfolio);
	}

	@Override
	public Portfolio getPortfolio(int portNo , String sessionUserId) throws Exception {
		// TODO Auto-generated method stub
		return portfolioDAO.getPortfolio(portNo, sessionUserId);
	}

	@Override
	public List<Portfolio> getPortfolioList(Search search, String sessionUserId) throws Exception {
		List<Portfolio> portfolioList = portfolioDAO.getPortfolioList(search,sessionUserId);
		return portfolioList;
	}
	
	@Override
	public List<Portfolio> getProfilePortList(String sessionUserId, String profileUserId) throws Exception {
		List<Portfolio> portfolioList = portfolioDAO.getProfilePortList(sessionUserId, profileUserId);
		return portfolioList;
	}
	
	@Override
	public List<Portfolio> getProfilePortScrapList(String sessionUserId, String profileUserId) throws Exception {
		List<Portfolio> portfolioList = portfolioDAO.getProfilePortScrapList(sessionUserId, profileUserId);
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

	@Override
	public void addPortLike(PortLike portLike) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.addPortLike(portLike);
	}

	@Override
	public void deletePortLike(int portLikeNo) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.deletePortLike(portLikeNo);
	}

	@Override
	public void updatePortCount(Portfolio portfolio) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.updatePortCount(portfolio);
	}

	@Override
	public void deletePortfolio(int portNo) throws Exception {
		// TODO Auto-generated method stub
		portfolioDAO.deletePortfolio(portNo);
	}

}
