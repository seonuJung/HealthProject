package kr.health.mvc.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.health.mvc.dao.CommentDAO;
import kr.health.mvc.vo.CommentVO;

@Service("commentService")
@Transactional
public class CommentServiceImple implements CommentService {

	@Autowired
	CommentDAO commentDAO;

	@Override
	public List<CommentVO> CommentList() {
		List<CommentVO> list = null;

		try {
			list = commentDAO.CommentList();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<CommentVO> selectByRef(int ref) {
		List<CommentVO> list = null;
		
		list = commentDAO.selectByRef(ref);
		
		return list;
	}

	@Override
	public int countByRef(int ref) {
		int count =0;
		
		count = commentDAO.countByRef(ref);
		
		return count;
	}

	@Override
	public void CommentInsert(CommentVO commentVO) {
		if(commentVO != null) {
			if(commentVO.getSys_name()!=null && commentVO.getSys_name().trim().length()>0) {
				if(commentVO.getSys_id()!=null && commentVO.getSys_id().trim().length()>0) {
					if(commentVO.getSys_content()!=null && commentVO.getSys_content().trim().length()>0) {
						try {
							commentDAO.CommentInsert(commentVO);
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}

	@Override
	public void CommentUpdate(CommentVO commentVO) {
		if (commentVO != null) {
			try {
				commentDAO.CommentUpdate(commentVO);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void CommentDelete(CommentVO commentVO) {
		if (commentVO != null) {
			try {
				commentDAO.CommentDelete(commentVO.getCm_idx());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void refDelete(CommentVO commentVO) {
		if (commentVO != null) {
			try {
				commentDAO.refDelete(commentVO.getRef());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
