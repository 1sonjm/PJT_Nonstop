package com.nonstop.service.letter.letterImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Letter;
import com.nonstop.domain.Search;
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

	/*public Map<String, Object> listLetter(Search search) throws Exception {
		List<Letter> list = letterDAO.listLetter(search);
		int totalCount = letterDAO.getTotalCount(search);
		
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public Letter getLetter(int letterNo) throws Exception {
		return letterDAO.getLetter(letterNo);
	}

	public void deleteLetter(int letterNo) throws Exception {
		letterDAO.deleteLetter(letterNo);
	}
	*/

}
