package com.nonstop.service.statistics.impl;

import java.sql.SQLClientInfoException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Statistics;
import com.nonstop.service.statistics.StatisticsDAO;

@Repository("statisticsDAOImpl")
public class StatisticsDAOImpl implements StatisticsDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public StatisticsDAOImpl(){
		System.out.println(this.getClass());
	}
	
	@Override
	public int addStatisticsData(Statistics statistics) {
		return sqlSession.insert("StatisticsMapper.addStatistics", statistics);
	}

	@Override
	public int addStatisticsDataList() {
		List<Statistics> dataList = sqlSession.selectList("StatisticsMapper.getListStatisticsData");

//		for(Statistics statistics : dataList){
//			System.out.println("조회 data : "+statistics);
//		}
		
		return sqlSession.insert("StatisticsMapper.addListStatisticsData",dataList);
	}
	@Override
	public List<Statistics> getTotalStatisticsList() {
		return sqlSession.selectList("StatisticsMapper.getListTotalStatistics");
	}

	@Override
	public List<Statistics> getMajorStatisticsList(int techClass) {
		return sqlSession.selectList("StatisticsMapper.getListMajorStatistics", techClass);
	}

	@Override
	public List<Statistics> getPeriodStatisticsList(Statistics statistics) {
		return sqlSession.selectList("StatisticsMapper.getListPeriodStatistics", statistics);
	}

	@Override
	public List<Statistics> getRegionStatisticsList(Statistics statistics) {
		return sqlSession.selectList("StatisticsMapper.getListRegionStatistics", statistics);
	}

	@Override
	public List<Integer> getPostCountList() {
		return sqlSession.selectList("StatisticsMapper.getListPostCount");
	}

	@Override
	public List<Statistics> getUserStatisticsList(String userId) {
		return sqlSession.selectList("StatisticsMapper.getListUserStatistics", userId);
	}

}
