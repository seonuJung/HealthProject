package kr.health.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kr.health.mvc.vo.TrainerVO;

public interface TrainerDAO {
	public List<TrainerVO> ptList() throws SQLException;
	public void ptInsert(TrainerVO trainerVO) throws SQLException;
	public void ptUpdate(TrainerVO trainerVO) throws SQLException;
	public void ptDelete(int pt_idx) throws SQLException;
}
