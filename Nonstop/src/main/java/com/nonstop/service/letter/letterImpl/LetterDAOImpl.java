package com.nonstop.service.letter.letterImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Letter;
import com.nonstop.domain.Search;
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

	/*public List<Letter> listLetter(Search search) throws Exception {
		return sqlSession.selectList("LetterMapper.getListLetter",search);
	}

	public Letter getLetter(int letterNo) throws Exception {
		return sqlSession.selectOne("LetterMapper.getLetter",letterNo);
	}

	public void deleteLetter(int letterNo) throws Exception {
		sqlSession.delete("LetterMapper.deleteLetter", letterNo);
	}

	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("LetterMapper.getTotalCount",search);
	}*/

}
