package kr.health.mvc.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.health.mvc.vo.JoinVO;

public interface JoinDAO {
	public JoinVO joinByIdx(int member_idx) throws SQLException;
	public JoinVO joinByMemberId(HashMap<String, String> map) throws SQLException;
	public List<JoinVO> joinList() throws SQLException;
	public void joinInsert(JoinVO joinVO) throws SQLException;
	public void joinUpdate(JoinVO joinVO) throws SQLException;
	public void joinDelete(int member_idx) throws SQLException;
	public void trainerDelete(HashMap<String, String> map) throws SQLException;
	public void memberDelete(HashMap<String, String> map) throws SQLException;
}
