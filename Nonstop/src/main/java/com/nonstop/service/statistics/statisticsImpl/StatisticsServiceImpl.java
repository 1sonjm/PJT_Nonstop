package com.nonstop.service.statistics.statisticsImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Statistics;
import com.nonstop.service.statistics.StatisticsDAO;
import com.nonstop.service.statistics.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService {

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
		try{
			return statisticsDAO.addStatisticsData(statistics);
		}catch(Exception e){
			System.out.println("[exception] : "+e.getMessage());
			return 0;
		}
	}

}
