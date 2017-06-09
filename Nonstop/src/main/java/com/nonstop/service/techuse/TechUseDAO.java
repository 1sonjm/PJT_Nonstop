package com.nonstop.service.techuse;

import java.util.List;

import com.nonstop.domain.Tech;
import com.nonstop.domain.TechUse;


public interface TechUseDAO {
	
	public void addTechUse(TechUse techUse) throws Exception;

//	public List<TechUse> getTechUse(int techNo) throws Exception;
	public TechUse getTechUse(int tuNo) throws Exception;

	public List<TechUse> listTechUse(int tuProjNo) throws Exception;
	
	public void updateTechUse(TechUse techUse) throws Exception;
	
	public void deleteTechUse(TechUse techUse) throws Exception;
	
}