package com.nonstop.service.techuse;

import java.util.List;

import com.nonstop.domain.Tech;
import com.nonstop.domain.TechUse;


public interface TechUseDAO {
	
	public void addTechUse(int tuTechNo, int tuProjNo) throws Exception;

	public void addTechUsePort(int tuTechNo, int tuPortNo) throws Exception;
//	public List<TechUse> getTechUse(int techNo) throws Exception;
	public TechUse getTechUse(int tuNo) throws Exception;
	
	public List<TechUse> getTechUseList(int tuProjNo) throws Exception;

	public List<TechUse> listTechUse(List<Integer> projNoList) throws Exception;
	
	public void updateTechUse(TechUse techUse) throws Exception;
	
	public void deleteTechUse(int tuProjNo) throws Exception;
	
	public void deleteTechUsePort(int tuPortNo) throws Exception;
	
}