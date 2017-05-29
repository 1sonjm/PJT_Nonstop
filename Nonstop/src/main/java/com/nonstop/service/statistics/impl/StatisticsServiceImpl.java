package com.nonstop.service.statistics.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
		Calendar operatingTime = Calendar.getInstance();
		operatingTime.setTime(new Date());
		System.out.println("[DataSync]작동 시각:\t"+ operatingTime.getTime().toString());
		
		operatingTime.add(Calendar.SECOND, (syncDay*syncHour*syncMin*syncSec));
		System.out.println("[DataSync]다음 작동 시각:\t"+ operatingTime.getTime().toString());
		
		return statisticsDAO.addStatisticsDataList();
	}
	
	@Override
	public List<Statistics> getTechClassList(){
		return statisticsDAO.getTechClassList();
	}
	@Override
	public List<Statistics> getTechDataList(int classDiv){
		return statisticsDAO.getTechDataList(classDiv);
	}
	
	@Override
	public List<Statistics> getTotalStatisticsList() {
		return statisticsDAO.getTotalStatisticsList();
	}

	@Override
	public List<Statistics> getMajorStatisticsList(int techClass) {
		return statisticsDAO.getMajorStatisticsList(techClass);
	}

	@Override
	public List<Statistics> getPeriodStatisticsList(Statistics statistics) {
		return statisticsDAO.getPeriodStatisticsList(statistics);
	}

	@Override
	public List<Statistics> getRegionStatisticsList(Statistics statistics) {
		return statisticsDAO.getRegionStatisticsList(statistics);
	}

	@Override
	public Map<String, Integer> getPostCountList() {
		return statisticsDAO.getPostCountList();
	}

	@Override
	public List<Statistics> getUserStatisticsList(String userId) {
		return statisticsDAO.getUserStatisticsList(userId);
	}

	@Override
	public void testSync() {		
		Calendar operatingTime = Calendar.getInstance();
		operatingTime.setTime(new Date());
		System.out.println("[DataSync]작동 시각:\t"+ operatingTime.getTime().toString());
		
		operatingTime.add(Calendar.SECOND, (syncDay*syncHour*syncMin*syncSec));
		System.out.println("[DataSync]다음 작동 시각:\t"+ operatingTime.getTime().toString());
	}

}
