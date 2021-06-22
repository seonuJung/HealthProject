package kr.health.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kr.health.mvc.vo.CommentVO;

public interface CommentDAO {
	public List<CommentVO> CommentList() throws SQLException;
	public List<CommentVO> selectByRef(int ref);
	public int countByRef(int ref);
	public void CommentInsert(CommentVO commentVO) throws SQLException;
	public void CommentUpdate(CommentVO commentVO) throws SQLException;
	public void CommentDelete(int cm_idx) throws SQLException;
	public void refDelete(int ref) throws SQLException;
}
