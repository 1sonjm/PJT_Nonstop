package com.nonstop.service.statistics;

import java.util.List;

import com.nonstop.domain.Statistics;

public interface StatisticsService {

	public int addStatisticsDataList();
	
	public int addStatisticsData(Statistics statistics);
	
	public List<Statistics> getJSONTotalStatisticsList();

	public List<Statistics> getJSONMajorStatisticsList(Statistics statistics);
	
	public List<Statistics> getJSONPeriodStatisticsList(Statistics statistics);
	
	public List<Statistics> getJSONRegionStatisticsList(Statistics statistics);
	
	public List<Integer> getPostCountList();
	
	public List<Statistics> getUserStatisticsList(String userId);
	
	public void test();
}
