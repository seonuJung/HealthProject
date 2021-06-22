package kr.health.mvc;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.health.mvc.service.NoticeService;
import kr.health.mvc.vo.CommVO;
import kr.health.mvc.vo.JoinVO;
import kr.health.mvc.vo.NoticeVO;
import kr.health.mvc.vo.PagingVO;

@Controller
public class NewsController {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/news")
	public String newsList(@ModelAttribute CommVO commVO, Model model,HttpSession session){
		PagingVO<NoticeVO> pagingVO = noticeService.noticeList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		model.addAttribute("pv",pagingVO);
		return "news";
	}
	
	@RequestMapping(value = "/newsinsert")
	public String newsInsert(HttpSession session,Model model){
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		return "newsinsert";
	}

	@RequestMapping(value = "/newsinsertOk")
	public String newsUpdate(@ModelAttribute CommVO commVO,@ModelAttribute NoticeVO noticeVO, Model model){
		switch (noticeVO.getNotice_mode()) {
		case "insert":
			noticeService.noticeInsert(noticeVO);
			break;
		case "update":
			noticeService.noticeUpdate(noticeVO);
			break;
		case "delete":
			noticeService.noticeDelete(noticeVO);
			break;
		}
		
		PagingVO<NoticeVO> pagingVO = noticeService.noticeList(commVO.getCurrentPage(), commVO.getPageSize(), commVO.getBlockSize());
		model.addAttribute("pv",pagingVO);
		return "redirect:news";
	}
	
	@RequestMapping(value = "/newsview")
	public String newsView(Model model, int notice_idx){
		NoticeVO news = noticeService.noticeByIdx(notice_idx);
		
		model.addAttribute("news",news);
		return "newsview";
	}
}
