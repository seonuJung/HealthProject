package kr.health.mvc.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.health.mvc.dao.CommentDAO;
import kr.health.mvc.dao.SuggestionsDAO;
import kr.health.mvc.vo.PagingVO;
import kr.health.mvc.vo.SuggestionsVO;

@Service("suggestionsService")
@Transactional
public class SuggestionsServiceImple implements SuggestionsService {

	@Autowired
	SuggestionsDAO suggestionsDAO;
	
	@Autowired
	CommentDAO commentDAO;

	@Override
	public SuggestionsVO suggestionsByIdx(int sg_idx) {
		SuggestionsVO suggestionsVO = null;
		try {
				suggestionsVO = suggestionsDAO.suggestionsByIdx(sg_idx);
				if(suggestionsVO !=null) {
					suggestionsVO.setList(commentDAO.selectByRef(sg_idx));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return suggestionsVO;
	}

	@Override
	public PagingVO<SuggestionsVO> suggestionsList(int currentPage, int pageSize, int blockSize) {
		PagingVO<SuggestionsVO> pagingVO = null;

		try {
			int totalCount = suggestionsDAO.suggestionsCount();
			pagingVO = new PagingVO<SuggestionsVO>(totalCount, currentPage, pageSize, blockSize);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("endNo", pagingVO.getEndNo());
			pagingVO.setList(suggestionsDAO.suggestionsList(map));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pagingVO;
	}

	@Override
	public void suggestionsInsert(SuggestionsVO suggestionsVO) {
		if (suggestionsVO != null) {
			if (suggestionsVO.getMember_name() != null && suggestionsVO.getMember_name().trim().length() > 0) {
				if (suggestionsVO.getMember_id() != null && suggestionsVO.getMember_id().trim().length() > 0) {
					if (suggestionsVO.getMember_title() != null && suggestionsVO.getMember_title().trim().length() > 0) {
						if (suggestionsVO.getMember_content() != null && suggestionsVO.getMember_content().trim().length() > 0) {
							try {
								suggestionsDAO.suggestionsInsert(suggestionsVO);
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}

	@Override
	public void suggestionsUpdate(SuggestionsVO suggestionsVO) {
		if (suggestionsVO != null) {
			try {
				suggestionsDAO.suggestionsUpdate(suggestionsVO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void suggestionsDelete(SuggestionsVO suggestionsVO) {
		if(suggestionsVO!=null) {
			try {
				suggestionsDAO.suggestionsDelete(suggestionsVO.getSg_idx());
				commentDAO.refDelete(suggestionsVO.getSg_idx());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
