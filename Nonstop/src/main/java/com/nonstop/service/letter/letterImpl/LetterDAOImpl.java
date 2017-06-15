package com.nonstop.service.letter.letterImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Letter;
import com.nonstop.service.letter.LetterDAO;

@Repository("letterDAOImpl")
public class LetterDAOImpl implements LetterDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public LetterDAOImpl(){
		System.out.println(this.getClass());
	}

	public void addLetter(Letter letter) throws Exception {
		sqlSession.insert("LetterMapper.addLetter",letter);
	}

	public List<Letter> getReceiveLetterList(String receiveId) throws Exception {
		return sqlSession.selectList("LetterMapper.getReceiveLetterList",receiveId);
	}
	
	public List<Letter> getSendLetterList(String sendId) throws Exception {
		return sqlSession.selectList("LetterMapper.getListSendLetter",sendId);
	}

	public Letter getLetter(int letNo) throws Exception {
		return sqlSession.selectOne("LetterMapper.getLetter",letNo);
	}

	public void deleteLetter(int letNo) throws Exception {
		sqlSession.delete("LetterMapper.deleteLetter", letNo);
	}
	
	public void updateReadDate(int letNo) throws Exception{
		sqlSession.update("LetterMapper.updateReadDate",letNo);
	}
	
	public void updateSave(int letNo) throws Exception{
		sqlSession.update("LetterMapper.updateSave",letNo);
	}
	
	public void addSave(int letNo) throws Exception{
		sqlSession.update("LetterMapper.addSave",letNo);
	}

	public void deleteSave(int letNo) throws Exception {
		sqlSession.update("LetterMapper.deleteSave",letNo);
	}
	
	public void updateRecView(int letNo , String userId) throws Exception{
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("letNo", letNo);
		map.put("userId", userId);
		
		sqlSession.update("LetterMapper.updateRecView", map);
	}
	
	public void updateSendView(int letNo , String userId) throws Exception{
		
		Map<String , Object> map = new HashMap<String , Object>();
		
		map.put("letNo", letNo);
		map.put("userId", userId);
		
		sqlSession.update("LetterMapper.updateSendView", map);
	}

	public List<Letter> getSaveLetterList(String userId) throws Exception {
		return sqlSession.selectList("LetterMapper.getSaveLetterList", userId);
	}

	public List<Letter> getUnreadLetterList(String userId) throws Exception {
		return sqlSession.selectList("LetterMapper.getUnreadLetterList", userId);
	}
	
	
}




