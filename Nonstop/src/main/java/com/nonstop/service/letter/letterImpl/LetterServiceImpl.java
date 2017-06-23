package com.nonstop.service.letter.letterImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Letter;
import com.nonstop.service.letter.LetterDAO;
import com.nonstop.service.letter.LetterService;

@Service("letterServiceImpl")
public class LetterServiceImpl implements LetterService {

	@Autowired
	@Qualifier("letterDAOImpl")
	private LetterDAO letterDAO;
	public void setLetterDAO(LetterDAO letterDAO){
		this.letterDAO = letterDAO;
	}
	public LetterServiceImpl(){
		System.out.println(this.getClass());
	}

	public void addLetter(Letter letter) throws Exception {
		letterDAO.addLetter(letter);
	}
	
	public void addApplicantLetter(String sendId, String receiveId , String letTitle , String letDetail) throws Exception {
		letterDAO.addApplicantLetter(sendId, receiveId , letTitle , letDetail);
		
	}

	public Map<String, Object> getReceiveLetterList(String receiveId) throws Exception {
			
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Letter> list =letterDAO.getReceiveLetterList(receiveId);
		
		map.put("list", list);
		
		return map;
	}
	
	public Map<String, Object> getSendLetterList(String sendId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Letter> list =letterDAO.getSendLetterList(sendId);
		
		map.put("list", list);
		
		return map;
	}

	public Letter getLetter(int letNo) throws Exception {
		return letterDAO.getLetter(letNo);
	}

	public void deleteLetter(int letNo) throws Exception {
		letterDAO.deleteLetter(letNo);
	}
	
	public void updateReadDate(int letNo) throws Exception{
		letterDAO.updateReadDate(letNo);
	}
	
	public void updateSave(int letNo) throws Exception{
		letterDAO.updateSave(letNo);
	}

	public void addSave(int letNo) throws Exception {
		letterDAO.addSave(letNo);
	}

	public void deleteSave(int letNo) throws Exception {
		letterDAO.deleteSave(letNo);
	}
	
	public void updateRecView(int letNo , String userId) throws Exception{
		letterDAO.updateRecView(letNo, userId);
	}
	
	public void updateSendView(int letNo , String userId) throws Exception{
		letterDAO.updateSendView(letNo, userId);
	}

	public Map<String, Object> getSaveLetterList(String userId) throws Exception {
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		List<Letter> list =letterDAO.getSaveLetterList(userId);
		
		map.put("list", list);
		
		return map;
	}
	
	public List<Letter> getUnreadLetterList(String userId) throws Exception {
		return letterDAO.getUnreadLetterList(userId);
	}

	

}










