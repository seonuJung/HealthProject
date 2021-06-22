package kr.health.mvc.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.health.mvc.dao.TrainerDAO;
import kr.health.mvc.vo.TrainerVO;

@Service("trainerService")
@Transactional
public class TrainerServiceImple implements TrainerService{

	@Autowired
	TrainerDAO trainerDAO;
	
	@Override
	public List<TrainerVO> ptList() {
		List<TrainerVO> list = null;
		
		try {
			list = trainerDAO.ptList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void ptInsert(TrainerVO trainerVO) {
	if(trainerVO != null) {
		if(trainerVO.getTrainer_id()!=null && trainerVO.getTrainer_id().trim().length()>0) {
			if(trainerVO.getPt_time()!=null && trainerVO.getPt_time().trim().length()>0) {
				if(trainerVO.getMember_name()!=null && trainerVO.getMember_name().trim().length()>0) {
					if(trainerVO.getPt_age()!=null && trainerVO.getPt_age().trim().length()>0) {
						if(trainerVO.getPt_exercise()!=null && trainerVO.getPt_exercise().trim().length()>0) {
							if(trainerVO.getPt_exercise()!=null && trainerVO.getPt_exercise().trim().length()>0) {
								if(trainerVO.getPt_remain()!= 0) {
									if(trainerVO.getMember_phone()!=null && trainerVO.getMember_phone().trim().length()>0) {
										if(trainerVO.getMember_phone()!=null && trainerVO.getMember_phone().trim().length()>0) {
											try {
												trainerDAO.ptInsert(trainerVO);
											} catch (SQLException e) {
												e.printStackTrace();
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

	@Override
	public void ptUpdate(TrainerVO trainerVO) {
		if(trainerVO != null) {
			try {
				trainerDAO.ptUpdate(trainerVO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void ptDelete(TrainerVO trainerVO) {
		if(trainerVO != null) {
			try {
				trainerDAO.ptDelete(trainerVO.getPt_idx());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
