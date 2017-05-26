package com.nonstop.service.statistics;

import java.util.List;

import com.nonstop.domain.Statistics;

public interface StatisticsService {

	public int addStatisticsDataList();
	
	public int addStatisticsData(Statistics statistics);
	
	public List<Statistics> getTotalStatisticsList();

	public List<Statistics> getMajorStatisticsList(int techClass);
	
	public List<Statistics> getPeriodStatisticsList(Statistics statistics);
	
	public List<Statistics> getRegionStatisticsList(Statistics statistics);
	
	public List<Integer> getPostCountList();
	
	public List<Statistics> getUserStatisticsList(String userId);
	
	public void testSync();

}
