package controller.tdd;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nonstop.domain.Statistics;
import com.nonstop.service.statistics.StatisticsService;

@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
													"classpath:config/context-aspect.xml",
													"classpath:config/context-mybatis.xml",
													"classpath:config/context-transaction.xml" })
public class StatisticsServiceTest {

	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;

	//@Test
	public void addStatisticsData() throws Exception {

		Statistics statistics = new Statistics();
		statistics.setDemand(30);
		statistics.setSupply(20);
		statistics.setUserRate(10.5);
		statistics.setLocation("서울시");
		statistics.setTechNo(1000);
		
		int result = statisticsService.addStatisticsData(statistics);
		
		Assert.assertEquals(1, result);

	}
	//@Test
	public void addStatisticsDataList()  throws Exception{
		Assert.assertEquals(true, (statisticsService.addStatisticsDataList()!=0));		
	}

	//@Test
	public void getTechClassList(){
		System.out.println(statisticsService.getTechClassList());
	}
	@Test
	public void getTechDataList(){
		System.out.println(statisticsService.getTechDataList(1));
	}
	
	//@Test
	public void getTotalStatisticsList()  throws Exception{
		List<Statistics> result = statisticsService.getTotalStatisticsList();
		for(Statistics data : result){
			System.out.println(data);
		}
	}

	//@Test
	public void getMajorStatisticsList()  throws Exception{
		//Statistics statistics
	}

	//@Test
	public void getPeriodStatisticsList()  throws Exception{
		//Statistics statistics
	}

	//@Test
	public void getRegionStatisticsList()  throws Exception{
		//Statistics statistics
	}

	//@Test
	public void getPostCountList()  throws Exception{
		Map<String, Integer> result = statisticsService.getPostCountList();
		System.out.println(result.get("DESIGN"));
		System.out.println(result.get("DEVELOP"));
		System.out.println(result.get("PROJECT"));
	}

	//@Test
	public void getUserStatisticsList()  throws Exception{
		//String userId
	}
}