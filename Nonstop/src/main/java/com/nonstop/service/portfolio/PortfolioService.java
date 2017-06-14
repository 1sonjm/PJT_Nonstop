package com.nonstop.service.portfolio;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.PortComment;
import com.nonstop.domain.PortLike;
import com.nonstop.domain.Portfolio;
import com.nonstop.domain.Search;

public interface PortfolioService {

	public void addPortfolio(Portfolio portfolio) throws Exception;

	public Portfolio getPortfolio(int portNo, String sessionUserId) throws Exception;
	
	public List<Portfolio> getPortfolioList(Search search, String sessionUserId) throws Exception;
	
	public List<Portfolio> getProfilePortList(String sessionUserId, String profileUserId) throws Exception;
	
	public List<Portfolio> getProfilePortScrapList(String sessionUserId, String profileUserId) throws Exception;
	
	public void updatePortfolio(Portfolio portfolio) throws Exception;

	public void deletePortfolio(int portNo) throws Exception;
	
	public void addComment(PortComment portComment) throws Exception;
	
	public List<PortComment> getCommentList(int comPortNo) throws Exception;
	
	public PortComment getComment(int comNo) throws Exception;
	
	public void deleteComment(int comNo) throws Exception;
	
	public void addPortLike(PortLike portLike) throws Exception;
	
	public void deletePortLike(int portLikeNo) throws Exception;
	
	public void updatePortCount(Portfolio portfolio) throws Exception;
}
