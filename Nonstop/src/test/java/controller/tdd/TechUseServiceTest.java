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

import com.nonstop.domain.Search;
import com.nonstop.domain.Tech;
import com.nonstop.domain.TechUse;
import com.nonstop.service.techuse.TechUseService;

@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
													"classpath:config/context-aspect.xml",
													"classpath:config/context-mybatis.xml",
													"classpath:config/context-transaction.xml" })
public class TechUseServiceTest {

	@Autowired
	@Qualifier("techUseServiceImpl")
	private TechUseService techUseService;

	//@Test
	public void getTechUseTest() throws Exception {
		
		TechUse techUse = new TechUse();
		
		
		techUse =techUseService.getTechUse(160);
		
		System.out.println("asdfasdfadsf"+techUse);
		
		
	}
	
	//@Test
	public void updateTechUseTest() throws Exception {

		TechUse techUse = new TechUse();
		
		techUse.setTuTechNo(3003);
		techUse.setTuNo(160);
		techUseService.updateTechUse(techUse);
		
		techUse = techUseService.getTechUse(160);
		System.out.println("ASdfadsfdsfadsf"+techUse);
		
		
	}
/*	//@Test
	public void testGetUserListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = projectService.listProject(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = projectService.listProject(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }*/
}