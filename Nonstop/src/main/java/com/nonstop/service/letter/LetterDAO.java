package com.nonstop.service.letter;

import java.util.List;

import com.nonstop.domain.Letter;

public interface LetterDAO {
	
	public void addLetter(Letter letter) throws Exception;
	
	public void addApplicantLetter(String sendId , String receiveId) throws Exception;
	
	public List<Letter> getReceiveLetterList(String receiveId) throws Exception;
	
	public List<Letter> getSendLetterList(String sendId) throws Exception;
	
	public Letter getLetter(int letNo) throws Exception;
	
	public void deleteLetter(int letNo) throws Exception;
	
	public void updateReadDate(int letNo) throws Exception;

	public void updateSave(int letNo) throws Exception;
	
	public void addSave(int letNo) throws Exception;
	
	public void deleteSave(int letNo) throws Exception;
	
	public void updateRecView(int letNo , String userId) throws Exception;
	
	public void updateSendView(int letNo , String userId) throws Exception;
	
	public List<Letter> getSaveLetterList(String userId) throws Exception;
	
	public List<Letter> getUnreadLetterList(String userId) throws Exception;
}
