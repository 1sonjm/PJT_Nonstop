package controller.tdd;

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

	@Test
	public void testAddStatisticsData() throws Exception {

		Statistics statistics = new Statistics();
		statistics.setDemand(30);
		statistics.setSupply(20);
		statistics.setUserRate(10.5);
		statistics.setLocation("서울시");
		statistics.setTechName("java");
		statistics.setTechClass(1);
		
		int result = statisticsService.addStatisticsData(statistics);
		
		Assert.assertEquals(1, result);

	}
}