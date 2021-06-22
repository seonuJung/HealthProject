package kr.health.mvc.service;


import kr.health.mvc.vo.PagingVO;
import kr.health.mvc.vo.SuggestionsVO;

public interface SuggestionsService {
	public SuggestionsVO suggestionsByIdx(int sg_idx);
	public PagingVO<SuggestionsVO> suggestionsList(int currentPage, int pageSize, int blockSize);
	public void suggestionsInsert(SuggestionsVO suggestionsVO);
	public void suggestionsUpdate(SuggestionsVO suggestionsVO);
	public void suggestionsDelete(SuggestionsVO suggestionsVO);
}
