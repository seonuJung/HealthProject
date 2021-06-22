package kr.health.mvc;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.health.mvc.service.CommentService;
import kr.health.mvc.service.SuggestionsService;
import kr.health.mvc.vo.CommVO;
import kr.health.mvc.vo.CommentVO;
import kr.health.mvc.vo.JoinVO;
import kr.health.mvc.vo.PagingVO;
import kr.health.mvc.vo.SuggestionsVO;

@Controller
public class GuestController {
	@Autowired
	SuggestionsService suggestionsService;
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value = "/guest")
	public String guestList(CommVO commVO, Model model,HttpSession session){
		PagingVO<SuggestionsVO> pagingVO = suggestionsService.suggestionsList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		model.addAttribute("pv",pagingVO);
		return "guest";
	}
	
	@RequestMapping(value = "/guestinsert")
	public String guestInsert(HttpSession session,Model model){
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		return "guestinsert";
	}

	@RequestMapping(value = "/guestinsertOk")
	public String guestUpdate(CommVO commVO,SuggestionsVO suggestionsVO, Model model){
		switch (suggestionsVO.getSuggestion_mode()) {
		case "insert":
			suggestionsService.suggestionsInsert(suggestionsVO);
			break;
		case "update":
			suggestionsService.suggestionsUpdate(suggestionsVO);
			break;
		case "delete":
			suggestionsService.suggestionsDelete(suggestionsVO);
			break;
		}
		
		PagingVO<SuggestionsVO> pagingVO = suggestionsService.suggestionsList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		model.addAttribute("pv",pagingVO);
		return "redirect:guest";
	}
	
	@RequestMapping(value = "/guestview")
	public String guestView(Model model, CommVO commVO, int sg_idx){
		SuggestionsVO guest = suggestionsService.suggestionsByIdx(sg_idx);
		PagingVO<SuggestionsVO> pagingVO = suggestionsService.suggestionsList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		int count = commentService.countByRef(sg_idx);
		
		model.addAttribute("count",count);
		model.addAttribute("pv",pagingVO);
		model.addAttribute("guest",guest);
		return "guestview";
	}
	
	@RequestMapping(value = "/commentOk")
	public String comment(Model model, CommVO commVO, CommentVO commentVO){

		SuggestionsVO guest = suggestionsService.suggestionsByIdx(commentVO.getRef());
		PagingVO<SuggestionsVO> pagingVO = suggestionsService.suggestionsList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		
		switch (commentVO.getCm_mode()) {
		case "insert":
			commentService.CommentInsert(commentVO);
			break;
		case "update":
			commentService.CommentUpdate(commentVO);
			break;
		case "delete":
			commentService.CommentDelete(commentVO);
			break;
		}
		
		model.addAttribute("sg_idx",commentVO.getRef());
		model.addAttribute("pv",pagingVO);
		model.addAttribute("guest",guest);
		return "redirect:guestview";
	}
	
}
