package com.nonstop.service.statistics;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.Statistics;
import com.nonstop.domain.User;

public interface StatisticsDAO {

	public int addStatisticsDataList();
	
	public int addStatisticsData(Statistics statistics);

	public List<Statistics> getTechClassList();
	public List<Statistics> getTechDataList(int classDiv);
	
	public List<Statistics> getTotalStatisticsList();

	public List<Statistics> getMajorStatisticsList(int techClass);
	
	public List<Statistics> getPeriodStatisticsList(Statistics statistics);
	
	public List<Statistics> getRegionStatisticsList(Statistics statistics);
	
	public Map<String, Integer> getPostCountList();
	
	public List<Statistics> getUserStatisticsList(User user);
	
}
