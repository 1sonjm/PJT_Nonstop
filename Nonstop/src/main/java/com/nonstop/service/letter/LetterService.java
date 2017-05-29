package com.nonstop.service.letter;

import java.util.Map;

import com.nonstop.domain.Letter;

public interface LetterService {
	
	public void addLetter(Letter letter) throws Exception;
	
	public Map<String, Object> getReceiveLetterList(String receiveId) throws Exception;
	
	public Map<String, Object> getSendLetterList(String sendId) throws Exception;
	
	public Letter getLetter(int letNo) throws Exception;
	
	public void deleteLetter(int letNo) throws Exception;
	
	public void updateReadDate(int letNo) throws Exception;

}
