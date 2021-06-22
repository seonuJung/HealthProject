package kr.health.mvc;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.health.mvc.service.JoinService;
import kr.health.mvc.vo.JoinVO;

@Controller
public class LoginJoinController {
	
	@Autowired
	JoinService joinService;
	

	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model) {
		// 쿠키를 읽자
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("member_id")) {
					model.addAttribute("member_id", cookie.getValue());
					break;
				}
			}
		}
		return "login";
	}
	
	// 회원가입폼
	@RequestMapping(value="/join")
	public String join(Model model) {
		return "join";
	}
	
	// get방식이면 로그인페이지로
	@RequestMapping(value="/joinOk", method=RequestMethod.GET)
	public String joinOkGET() {
		return "redirect:login";
	}

	// post방식이면 db에 저장하고 로그인페이지로
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public String joinOkPOST(@ModelAttribute JoinVO joinVO) {
		System.out.println(joinVO + "*************** joinOkPOST ***************************");
		// 서비스를 호출해서 DB에 저장
		joinService.joinInsert(joinVO);
		return "redirect:login";
	}
	
	@RequestMapping(value="/idCheck")
	@ResponseBody// 왜쓰는지 질문!
	public String idCheck(@RequestParam String member_id) {
		System.out.println(member_id + "******************* idCheck **************************");
		// 서비스를 호출해서 아이디 중복 검사
		String result = joinService.idCheck(member_id);
		return result;
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.GET)
	public String loginOkGET() {
		return "redirect:login";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public String loginOkPOST(@ModelAttribute JoinVO joinVO, @RequestParam(required=false) String remember,
			                  HttpServletRequest request, HttpServletResponse response) {
		System.out.println(joinVO + "*************** joinOkPOST ***************************");
		System.out.println(remember + "*************** joinOkPOST ***************************");
		// 서비스를 호출해서 로그인 확인
		JoinVO user = joinService.loginOk(joinVO);
		if(user==null) {
			return "redirect:/login";
		}else {
			request.getSession().setAttribute("user", user); // 세션에 저장
			// 아이디 자동 저장
			if(remember!=null && remember.equals("save")) {
				Cookie cookie = new Cookie("member_id", user.getMember_id());
				cookie.setMaxAge(60*60*24*7); // 일주일
				response.addCookie(cookie);
			}else {
				// 쿠키 삭제
				Cookie cookie = new Cookie("member_id", "");
				cookie.setMaxAge(0); 
				response.addCookie(cookie);
			}
			return "redirect:/";
		}
	}
	// 회원정보 수정
	@RequestMapping(value = "/joinupdate")
	public String updateJoin(Model model,HttpSession session) {
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		return "joinupdate";
	}
	@RequestMapping(value = "/joinupdateOk", method=RequestMethod.GET)
	public String updateJoinOkGET() {
		
		return "redirect:/";
	}
	@RequestMapping(value = "/joinupdateOk", method=RequestMethod.POST)
	public String updateJoinOkPOST(@ModelAttribute JoinVO joinVO,HttpServletRequest request) {
		System.out.println(joinVO + "*************** joinOkPOST ***************************");
		joinService.joinUpdate(joinVO);
		request.getSession().removeAttribute("user");
		return "redirect:login";
	}
	
	//관리자가 회원정보를 수정 삭제가능
	@RequestMapping(value = "/sysupdate")
	public String sysUpdate(Model model) {
		List<JoinVO> list = joinService.joinList();
		
		model.addAttribute("list",list);		
		return "sysupdate";
	}
	
	@RequestMapping(value = "/sysupdateOk",method=RequestMethod.POST)
	public String sysUpdateOk(Model model,JoinVO joinVO) {
		
		switch (joinVO.getMember_mode()) {
		case "update":
			joinService.joinUpdate(joinVO);
			break;
		case "delete":
			joinService.joinDelete(joinVO);
			joinService.trainerDelete(joinVO.getMember_id());
			if(joinVO.getGrade()==1) {
				joinService.memberDelete(joinVO.getMember_phone());
			}
			break;
		}
		
		List<JoinVO> list = joinService.joinList();
		
		model.addAttribute("list",list);		
		return "sysupdate";
	}
	
	// 세션에 저장된걸 제거하여 로그아웃
	@RequestMapping(value="/logout")
	public String loginOut(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "redirect:/";
	}
}
