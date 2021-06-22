package kr.health.mvc.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.health.mvc.vo.SuggestionsVO;

public interface SuggestionsDAO {
	public int suggestionsCount() throws SQLException;
	public SuggestionsVO suggestionsByIdx(int sg_idx) throws SQLException;
	public List<SuggestionsVO> suggestionsList(HashMap<String, Integer> map) throws SQLException;
	public void suggestionsInsert(SuggestionsVO suggestionsVO) throws SQLException;
	public void suggestionsUpdate(SuggestionsVO suggestionsVO) throws SQLException;
	public void suggestionsDelete(int sg_idx) throws SQLException;
}
