package com.nonstop.service.portfolio;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.Portfolio;

public interface PortfolioService {

	public void addPortfolio(Portfolio portfolio) throws Exception;

	public Portfolio getPortfolio(int portNo,String scrapUserId) throws Exception;
	
	public List<Portfolio> getPortfolioList(int portDivision, String scrapUserId) throws Exception;
	
	public void updatePortfolio(Portfolio portfolio) throws Exception;

}
