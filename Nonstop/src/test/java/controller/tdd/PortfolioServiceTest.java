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

import com.nonstop.domain.Portfolio;
import com.nonstop.domain.Project;
import com.nonstop.domain.Search;
import com.nonstop.service.portfolio.PortfolioService;
import com.nonstop.service.project.ProjectService;

@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
													"classpath:config/context-aspect.xml",
													"classpath:config/context-mybatis.xml",
													"classpath:config/context-transaction.xml" })
public class PortfolioServiceTest {

	@Autowired
	@Qualifier("portfolioServiceImpl")
	private PortfolioService portfolioService;

	//@Test
	public void getProjectTest() throws Exception {
		/*Portfolio portfolio= new Portfolio();
		portfolio.set
		System.out.println(portfolioService.addPortfolio(portfolio););
		*/
		
	}
}