package com.nonstop.service.techuse.techuseImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.TechUse;
import com.nonstop.service.techuse.TechUseDAO;
import com.nonstop.service.techuse.TechUseService;


@Service("techUseServiceImpl")
public class TechUseServiceImpl implements TechUseService{
	
	
	@Autowired
	@Qualifier("techUseDAOImpl")
	private TechUseDAO techUseDAO;
	
	public void setTechUse(TechUseDAO techUseDAO){
		this.techUseDAO = techUseDAO;
	}
	
	public TechUseServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void addTechUse(TechUse techUse) throws Exception {
		techUseDAO.addTechUse(techUse);
	}
	
//	public List<TechUse> getTechUse(int techNo) throws Exception{
//		
//		List<TechUse> list = techUseDAO.getTechUse(techNo);
//		return list;
//	}
	public TechUse getTechUse(int tuNo) throws Exception{
		
		return techUseDAO.getTechUse(tuNo);
	}
	
	public List<TechUse> listTechUse(int tuProjNo) throws Exception {
		
		return techUseDAO.listTechUse(tuProjNo);
	}
	
	public void updateTechUse(TechUse techUse) throws Exception {
		
		techUseDAO.updateTechUse(techUse);
	}
	
	public void deleteTechUse(TechUse techUse) throws Exception{
		
		techUseDAO.deleteTechUse(techUse);
	}
	
	
	/*@Override
	public void addComment(ProjComment projComment) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.addComment(projComment);
	}

	@Override
	public List<TechUse> getTechUseList(int tuProjNo) throws Exception {
		// TODO Auto-generated method stub		
		return techUseDAO.getTechUseList(tuProjNo);
	}
	
	@Override
	public ProjComment getComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.getComment(comNo);
	}

	@Override
	public void deleteComment(int comNo) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.deleteComment(comNo);
	}*/

	
	
	

}
