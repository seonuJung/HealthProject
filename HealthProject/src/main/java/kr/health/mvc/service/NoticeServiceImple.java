package kr.health.mvc.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.health.mvc.dao.NoticeDAO;
import kr.health.mvc.vo.NoticeVO;
import kr.health.mvc.vo.PagingVO;

@Service("noticeService")
@Transactional
public class NoticeServiceImple implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

	@Override
	public NoticeVO noticeByIdx(int notice_idx) {
		NoticeVO noticeVO = null;

		try {
			noticeVO = noticeDAO.noticeByIdx(notice_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return noticeVO;
	}

	@Override
	public PagingVO<NoticeVO> noticeList(int currentPage, int pageSize, int blockSize) {
		PagingVO<NoticeVO> pagingVO = null;

		try {
			int totalCount = noticeDAO.noticeCount();
			pagingVO = new PagingVO<NoticeVO>(totalCount, currentPage, pageSize, blockSize);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("endNo", pagingVO.getEndNo());
			pagingVO.setList(noticeDAO.noticeList(map));;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pagingVO;
	}

	@Override
	public void noticeInsert(NoticeVO noticeVO) {
		if(noticeVO != null) {
			if(noticeVO.getSys_name()!=null && noticeVO.getSys_name().trim().length()>0) {
				if(noticeVO.getSys_title()!=null && noticeVO.getSys_title().trim().length()>0) {
					if(noticeVO.getSys_content()!=null && noticeVO.getSys_content().trim().length()>0) {
						try {
							noticeDAO.noticeInsert(noticeVO);
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	@Override
	public void noticeUpdate(NoticeVO noticeVO) {
		if(noticeVO!=null) {
					try {
						noticeDAO.noticeUpdate(noticeVO);
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
	}

	@Override
	public void noticeDelete(NoticeVO noticeVO) {
		if(noticeVO!=null) {
			try {
				noticeDAO.noticeDelete(noticeVO.getNotice_idx());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
