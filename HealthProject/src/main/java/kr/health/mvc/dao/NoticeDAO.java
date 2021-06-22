package kr.health.mvc.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.health.mvc.vo.NoticeVO;

public interface NoticeDAO {
	public int noticeCount() throws SQLException;
	public NoticeVO noticeByIdx(int notice_idx) throws SQLException;
	public List<NoticeVO> noticeList(HashMap<String, Integer> map) throws SQLException;
	public void noticeInsert(NoticeVO noticeVO) throws SQLException;
	public void noticeUpdate(NoticeVO noticeVO) throws SQLException;
	public void noticeDelete(int notice_idx) throws SQLException;
}
