package com.nonstop.service.comment.commentImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Comment;
import com.nonstop.service.comment.CommentDAO;



//==> ȸ������ DAO CRUD ����
@Repository("commentDAOImpl")
public class CommentDAOImpl implements CommentDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CommentDAOImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
		System.out.println("CommentMapper"+comment);
	}
	
	public Comment getComment(int comProjNo) throws Exception {
		System.out.println("CommentMapper"+comProjNo);
		return sqlSession.selectOne("CommentMapper.getComment", comProjNo);
		
	}
	
	public void deleteComment(Comment comment) throws Exception{
		sqlSession.delete("CommentMapper.deleteComment", comment);
	}

	
	/*public Map<String , Object> listComment(Search search, String buyerId) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("buyerId", buyerId);
	
		System.out.println("#"+map);
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseList", map); 
		
		
		System.out.println();
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setBuyer((User)sqlSession.selectOne("UserMapper.getUser", list.get(i).getBuyer().getUserId()));
			list.get(i).setPurchaseProd((Product)sqlSession.selectOne("ProductMapper.getProduct", list.get(i).getPurchaseProd().getProdNo()));
		}
		
		map.put("totalCount", sqlSession.selectOne("PurchaseMapper.getTotalCount", buyerId));

		map.put("list", list);
		
		System.out.println("#"+list);
		System.out.println("search"+search);
		System.out.println("buyerId"+buyerId);
		
		System.out.println("���ϰ� ���� �úη�="+map);
		return map;
	}*/
	
}