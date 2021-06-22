package kr.health.mvc.service;



import java.util.List;

import kr.health.mvc.vo.JoinVO;

public interface JoinService {
	public JoinVO joinByIdx(int member_idx);
	public JoinVO joinByMemberId(String member_id);
	public List<JoinVO> joinList();
	public void joinInsert(JoinVO joinVO);
	public void joinUpdate(JoinVO joinVO);
	public void joinDelete(JoinVO joinVO);
	public void trainerDelete(String member_id);
	public void memberDelete(String member_phone);
	public String idCheck(String member_id);
	public JoinVO loginOk(JoinVO joinVO);
}
