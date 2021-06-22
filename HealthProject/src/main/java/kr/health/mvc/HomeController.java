package kr.health.mvc;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.health.mvc.calendar.service.LunarService;
import kr.health.mvc.calendar.vo.LunarVO;
import kr.health.mvc.service.JoinService;
import kr.health.mvc.service.TrainerService;
import kr.health.mvc.vo.JoinVO;
import kr.health.mvc.vo.TrainerVO;



@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LunarService lunarService;
	
	@Autowired
	JoinService joinService;
	
	@Autowired
	TrainerService trainerService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(required = false) Integer yy, @RequestParam(required = false) Integer mm,  Model model, HttpSession session) {
		if(yy==null) yy = Calendar.getInstance().get(Calendar.YEAR);
		if(mm==null) mm = Calendar.getInstance().get(Calendar.MONTH)+1;
		logger.info("{}년 {}월", yy, mm);
		// 월이 0보다 작아지면 년을 -1한다
		if(mm<=0) {
			mm = 12;
			yy--;
		}
		// 월이 12보다 많아지면 년을 +1한다
		if(mm>=13) {
			mm = 1;
			yy++;
		}
		if(yy<1) yy = Calendar.getInstance().get(Calendar.YEAR);
		
		// 1자리 월이면 비교하기위해 앞에 0을붙여준다
		String month = null;
		if(mm<10) {
			month = 0+Integer.toString(mm);
		}else {
			month = Integer.toString(mm); 
		}
		
		List<LunarVO> list = lunarService.getLunar(yy, mm);
		logger.info("{}", list);
		
		// 트레이너 등급이면 리스트에 정보를 담는다.
		JoinVO user = (JoinVO) session.getAttribute("user");
		List<TrainerVO> ptList = null;
		if(user != null) {
			ptList = trainerService.ptList();
		}
		
		model.addAttribute("month",month);
		model.addAttribute("user",user);
		model.addAttribute("ptList",ptList);
		model.addAttribute("yy", yy);
		model.addAttribute("mm", mm);
		model.addAttribute("list", list);
		return "calendar";
	}
	
	// 트레이너 스케줄
	@RequestMapping(value = "/plan")
	public String plan(Model model, String dd, String yy, String mm, HttpSession session) {
		List<TrainerVO> ptList = trainerService.ptList();
		
		if(mm.length() < 2) {
			mm = "0" + mm;
		}
		
		if(dd.length() < 2) {
			dd = "0" + dd;
		}
		
		String date = yy+mm+dd;
		
		List<JoinVO> userList = null;
		userList = joinService.joinList();
		
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		model.addAttribute("user",user);
		model.addAttribute("userList",userList);
		model.addAttribute("ptList",ptList);
		model.addAttribute("date",date);
		return "plan";
	}
	
	@RequestMapping(value = "/planupdate",method=RequestMethod.POST)
	public String planUpdate(@ModelAttribute TrainerVO trainerVO,Model model) {
		
		switch (trainerVO.getPt_mode()) {
		case "insert":
			trainerService.ptInsert(trainerVO);
			break;
		case "update":
			trainerService.ptUpdate(trainerVO);
			break;
		case "delete":
			trainerService.ptDelete(trainerVO);
			break;
		}
		
		String date = trainerVO.getPt_date();
		
		String dd = date.substring(6,8);
		String mm = date.substring(4,6);
		String yy = date.substring(0,4);
		
		model.addAttribute("yy",yy);
		model.addAttribute("mm",mm);
		model.addAttribute("dd",dd);
		return "redirect:plan";
	}
	
}
