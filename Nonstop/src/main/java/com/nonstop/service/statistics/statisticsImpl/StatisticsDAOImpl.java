package com.nonstop.service.statistics.statisticsImpl;

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
		try{
			return sqlSession.insert("StatisticsMapper.addStatistics", statistics);
		}catch(Exception e){
			System.out.println("[exception] : "+e.getMessage());
			return 0;
		}
	}

}
