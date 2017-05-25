package com.nonstop.service.statistics.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Statistics;
import com.nonstop.service.statistics.StatisticsDAO;
import com.nonstop.service.statistics.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Value("#{commonProperties['dataSync.sec']?: }")
	private int syncSec;
	@Value("#{commonProperties['dataSync.min']?: }")
	private int syncMin;
	@Value("#{commonProperties['dataSync.hour']?: }")
	private int syncHour;
	@Value("#{commonProperties['dataSync.day']?: }")
	private int syncDay;
	
	@Autowired
	@Qualifier("statisticsDAOImpl")
	private StatisticsDAO statisticsDAO;
	public void setStatisticsDAO(StatisticsDAO statisticsDAO){
		this.statisticsDAO = statisticsDAO;
	}
	
	public StatisticsServiceImpl(){
		System.out.println(this.getClass());
	}
	
	@Override
	public int addStatisticsData(Statistics statistics) {
		return statisticsDAO.addStatisticsData(statistics);
	}

	@Override
	public int addStatisticsDataList() {
		return statisticsDAO.addStatisticsDataList();
	}

	@Override
	public List<Statistics> getJSONTotalStatisticsList() {
		return statisticsDAO.getJSONTotalStatisticsList();
	}

	@Override
	public List<Statistics> getJSONMajorStatisticsList(Statistics statistics) {
		return statisticsDAO.getJSONMajorStatisticsList(statistics);
	}

	@Override
	public List<Statistics> getJSONPeriodStatisticsList(Statistics statistics) {
		return statisticsDAO.getJSONPeriodStatisticsList(statistics);
	}

	@Override
	public List<Statistics> getJSONRegionStatisticsList(Statistics statistics) {
		return statisticsDAO.getJSONRegionStatisticsList(statistics);
	}

	@Override
	public List<Integer> getPostCountList() {
		return statisticsDAO.getPostCountList();
	}

	@Override
	public List<Statistics> getUserStatisticsList(String userId) {
		return statisticsDAO.getUserStatisticsList(userId);
	}

	@Override
	public void test() {		
		Calendar operatingTime = Calendar.getInstance();
		operatingTime.setTime(new Date());
		System.out.println("[DataSync]작동 시각:\t"+ operatingTime.getTime().toString());
		
		operatingTime.add(Calendar.SECOND, (syncDay*syncHour*syncMin*syncSec));
		System.out.println("[DataSync]다음 작동 시각:\t"+ operatingTime.getTime().toString());
		
	}

}
