package controller.tdd;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nonstop.domain.Project;
import com.nonstop.service.project.ProjectService;

@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
													"classpath:config/context-aspect.xml",
													"classpath:config/context-mybatis.xml",
													"classpath:config/context-transaction.xml" })
public class UserServiceTest {

	@Autowired
	@Qualifier("projectServiceImpl")
	private ProjectService projectService;

	@Test
	public void testGetProject() throws Exception {
		
		
		Project project = new Project();
		
		
		
		project = projectService.getProject(1);

		//System.out.println(user);
		
//		Assert.assertEquals("testUserId", user.getUserId());
		
	}
}