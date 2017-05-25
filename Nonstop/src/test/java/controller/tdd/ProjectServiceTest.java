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
public class ProjectServiceTest {

	@Autowired
	@Qualifier("projectServiceImpl")
	private ProjectService projectService;

	//@Test
	public void getProjectTest() throws Exception {

		Project project = new Project();
		
		project = projectService.getProject(1);
		
		
	}
	
	//@Test
	public void updateProjectTest() throws Exception {

		Project project = new Project();
		
		project.setProjDivision(22);
		project.setProjTitle("바뀐제목이이거닷");
		//project.setProjAnnoEnd("");
		//project.setProjStartDate(2017/05/05);
		//project.setProjEndDate(2017/05/05);
		project.setProjLocation("인천 계양구");
		project.setProjDetail("이것이 바뀐 디테일이다");
		
		projectService.updateProject(project);
		
		project = projectService.getProject(16);
		
		
	}
}