package com.nonstop.service.comment.commentImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.nonstop.domain.Comment;
import com.nonstop.service.comment.CommentDAO;
import com.nonstop.service.comment.CommentService;


@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	@Qualifier("commentDAOImpl")
	private CommentDAO commentDAO;
	
	public void setCommentDao(CommentDAO commentDao){
		this.commentDAO = commentDAO;
	}
	
	public CommentServiceImpl(){
		
		System.out.println(this.getClass());
	}
	
	public void addComment(Comment comment) throws Exception{
		commentDAO.addComment(comment);
	}
	
	public Comment getComment(int comProjNo) throws Exception{
		return commentDAO.getComment(comProjNo);
	}
	
	public void deleteComment(Comment comment) throws Exception{
		commentDAO.deleteComment(comment);
	}
	
	/*public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception{
			
		return purchaseDao.getPurchaseList(search, buyerId);
		
	}*/
	
	
	
}