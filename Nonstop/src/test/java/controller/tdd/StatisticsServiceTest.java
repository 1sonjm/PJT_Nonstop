
package controller.tdd;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nonstop.domain.Statistics;
import com.nonstop.domain.User;
import com.nonstop.service.statistics.StatisticsService;

@RunWith(SpringJUnit4ClassRunner.class)

// @ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = {"classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
      "classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml"})
public class StatisticsServiceTest
{

@Autowired
@Qualifier("statisticsServiceImpl")
private StatisticsService statisticsService;

// @Test
public void addStatisticsData() throws Exception
{
	
	Statistics statistics = new Statistics();
	statistics.setDemand(30);
	statistics.setSupply(20);
	statistics.setUserRate(10.5);
	statistics.setLocation("서울시");
	statistics.setTechNo(1000);
	
	int result = statisticsService.addStatisticsData(statistics);
	
	Assert.assertEquals(1, result);
	
}
// @Test
public void addStatisticsDataList() throws Exception
{
	Assert.assertEquals(true, ( statisticsService.addStatisticsDataList()!=0 ));
}

// @Test
public void getTechClassList()
{
	System.out.println(statisticsService.getTechClassList());
}
// @Test
public void getTechDataList()
{
	System.out.println(statisticsService.getTechDataList(1));
}

// @Test
public void getTotalStatisticsList() throws Exception
{
	List<Statistics> result = statisticsService.getTotalStatisticsList();
	for(Statistics data: result)
	{
		System.out.println(data);
	}
}

// @Test
public void getMajorStatisticsList() throws Exception
{
	System.out.println(statisticsService.getMajorStatisticsList(1, 1));
}

// @Test
public void getPeriodStatisticsList() throws Exception
{
	Statistics statistics = new Statistics();
	statistics.setTechClass(1);
	statistics.setTechNo(1000);
	statistics.setSearchStartDate("2017/05/24");
	statistics.setSearchEndDate("2017/05/29");
	
	System.out.println(statisticsService.getPeriodStatisticsList(statistics));
}

// @Test
public void getRegionStatisticsList() throws Exception
{
	// Statistics statistics
}

// @Test
public void getPostCountList() throws Exception
{
	Map<String, Integer> result = statisticsService.getPostCountList();
	System.out.println(result.get("DESIGN"));
	System.out.println(result.get("DEVELOP"));
	System.out.println(result.get("PROJECT"));
}

// @Test
public void getUserStatisticsList() throws Exception
{
	User user = new User();
	user.setUserId("com02");
	user.setRole("3");
	
	System.out.println(statisticsService.getUserStatisticsList(user));
}

// @Test
public void createData() throws Exception
{
	
	List<Statistics> techList = statisticsService.getTechDataList(1);
	techList.addAll(statisticsService.getTechDataList(2));
	techList.addAll(statisticsService.getTechDataList(3));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	Calendar cal = Calendar.getInstance();
	for(int i = 1;i<20;i++)
	{
		cal.add(Calendar.DAY_OF_MONTH, -7);
		for(Statistics value: techList)
		{
			System.out.println("INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,"+value.getTechNo()+","
			      +randValue(1, 10)+","+randValue(0, 5)+","+randValue(5, 30)+",'"+sdf.format(cal.getTime())+"');");
		}
	}
}
private int randValue(int min, int range)
{
	Random rand = new Random();
	// nextInt is normally exclusive of the top value,
	// so add 1 to make it inclusive
	int randomNum = rand.nextInt(range)+min;
	return randomNum;
}

}
