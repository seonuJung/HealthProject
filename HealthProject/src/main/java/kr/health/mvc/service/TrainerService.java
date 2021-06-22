package kr.health.mvc.service;

import java.util.List;

import kr.health.mvc.vo.TrainerVO;

public interface TrainerService {
	public List<TrainerVO> ptList();
	public void ptInsert(TrainerVO trainerVO);
	public void ptUpdate(TrainerVO trainerVO);
	public void ptDelete(TrainerVO trainerVO);
}
