package com.nonstop.service.comment;

import com.nonstop.domain.Comment;

public interface CommentDAO {

	public void addComment(Comment comment) throws Exception;
	
	public Comment getComment(int comProjNo) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
//	public Map<String , Object> listComment(Comment search) throws Exception;
	

	
	
	
}
	