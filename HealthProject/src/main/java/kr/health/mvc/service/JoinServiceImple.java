package kr.health.mvc.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.health.mvc.dao.JoinDAO;
import kr.health.mvc.vo.JoinVO;

@Service("joinService")
@Transactional
public class JoinServiceImple implements JoinService {

	@Autowired
	JoinDAO joinDAO;

	@Override//idx로 1개읽기
	public JoinVO joinByIdx(int member_idx) {
		JoinVO joinVO = null;

		try {
			joinVO = joinDAO.joinByIdx(member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return joinVO;
	}
	
	@Override//id로 한개읽기
	public JoinVO joinByMemberId(String member_id) {
		JoinVO joinVO = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		try {
			joinVO = joinDAO.joinByMemberId(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return joinVO;
	}

	@Override //회원 전체읽기
	public List<JoinVO> joinList() {
		List<JoinVO> list = null;
		
		try {
			list = joinDAO.joinList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void joinInsert(JoinVO joinVO) {
		if (joinVO != null) {
			if (joinVO.getMember_id() != null && joinVO.getMember_id().trim().length() > 0) {
				if (joinVO.getMember_password() != null && joinVO.getMember_password().trim().length() > 0) {
					if (joinVO.getMember_name() != null && joinVO.getMember_name().trim().length() > 0) {
						if (joinVO.getMember_birth() != null && joinVO.getMember_birth().trim().length() > 0) {
							if (joinVO.getMember_phone() != null && joinVO.getMember_phone().trim().length() > 0) {
								if (joinVO.getWeight() != 0) {
									if (joinVO.getHeight() != 0) {
										if (joinVO.getGrade() == 1 || joinVO.getGrade() == 2
												|| joinVO.getGrade() == 3) {
											try {
												joinDAO.joinInsert(joinVO);
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

	@Override // 자신정보 수정
	public void joinUpdate(JoinVO joinVO) {
		if(joinVO != null) {
			try {
				joinDAO.joinUpdate(joinVO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

	@Override // 탈퇴
	public void joinDelete(JoinVO joinVO) {
		if(joinVO!=null) {
			JoinVO dbVO;
			try {
				dbVO = joinDAO.joinByIdx(joinVO.getMember_idx());
				if(dbVO!=null && dbVO.getMember_password().equals(joinVO.getMember_password())) {
					joinDAO.joinDelete(joinVO.getMember_idx());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void trainerDelete(String member_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		try {
			joinDAO.trainerDelete(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void memberDelete(String member_phone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_phone", member_phone);
		try {
			joinDAO.memberDelete(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 아이디 중복 검사
	public String idCheck(String member_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		JoinVO vo = null;
		try {
			vo = joinDAO.joinByMemberId(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo == null ? "0" : "1";
	}

	// 로그인 처리
	public JoinVO loginOk(JoinVO joinVO) {
		JoinVO vo = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", joinVO.getMember_id());
		try {
			vo = joinDAO.joinByMemberId(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (vo != null) {
			if (!vo.getMember_password().equals(joinVO.getMember_password())) {
				vo = null;
			}
		}
		return vo;
	}


}
