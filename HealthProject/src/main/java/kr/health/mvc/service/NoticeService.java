package kr.health.mvc.service;


import kr.health.mvc.vo.NoticeVO;
import kr.health.mvc.vo.PagingVO;

public interface NoticeService {
	public NoticeVO noticeByIdx(int notice_idx);
	public PagingVO<NoticeVO> noticeList(int currentPage, int pageSize, int blockSize);
	public void noticeInsert(NoticeVO noticeVO);
	public void noticeUpdate(NoticeVO noticeVO);
	public void noticeDelete(NoticeVO noticeVO);
}
