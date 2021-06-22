package kr.health.mvc.service;

import java.util.List;

import kr.health.mvc.vo.CommentVO;

public interface CommentService {
	public List<CommentVO> CommentList();
	public List<CommentVO> selectByRef(int ref);
	public int countByRef(int ref);
	public void CommentInsert(CommentVO commentVO);
	public void CommentUpdate(CommentVO commentVO);
	public void CommentDelete(CommentVO commentVO);
	public void refDelete(CommentVO commentVO);
}
