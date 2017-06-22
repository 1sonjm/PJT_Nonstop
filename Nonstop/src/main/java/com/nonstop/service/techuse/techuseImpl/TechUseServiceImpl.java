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
	
	public void addTechUse(int tuTechNo, int tuProjNo) throws Exception{
		techUseDAO.addTechUse(tuTechNo, tuProjNo);
	}
	
	public void addTechUsePort(TechUse techUse) throws Exception {
		techUseDAO.addTechUsePort(techUse);
	}
	
	public TechUse getTechUse(int tuNo) throws Exception{
		
		return techUseDAO.getTechUse(tuNo);
	}
	
	public List<TechUse> getTechUseList(int tuProjNo) throws Exception {
		
		return techUseDAO.getTechUseList(tuProjNo);
	}
	
	public void updateTechUse(TechUse techUse) throws Exception {
		
		techUseDAO.updateTechUse(techUse);
	}
	
	public void deleteTechUse(int tuProjNo) throws Exception{
		
		techUseDAO.deleteTechUse(tuProjNo);
	}
	@Override
	public List<TechUse> listTechUse(List<Integer> projNoList) throws Exception {
		return techUseDAO.listTechUse(projNoList);
	}
	
}
