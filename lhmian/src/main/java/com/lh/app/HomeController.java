package com.lh.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lh.app.comm.domain.Criteria;
import com.lh.app.comm.domain.MemPageVO;
import com.lh.app.comm.domain.PageVO;
import com.lh.app.comm.domain.PersonalCriteria;
import com.lh.app.comm.service.CommService;
import com.lh.app.conference.domain.MyConfCriteria;
import com.lh.app.conference.service.ConfService;
import com.lh.app.cs.domain.MyCsCriteria;
import com.lh.app.cs.service.CsService;
import com.lh.app.signIn.etc.CustomUserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired CommService commService;
	@Autowired CsService csService;
	@Autowired ConfService confService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/home/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/myPage/myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	@RequestMapping("/myPage/myWrittenList")
	public String myWrittenList(Model model, 
			@ModelAttribute("commCri") PersonalCriteria commCri,
			@ModelAttribute("cri") Criteria cri,
			@ModelAttribute("csCri") MyCsCriteria csCri, 
			@ModelAttribute("confCri") MyConfCriteria confCri, 
			@AuthenticationPrincipal CustomUserDetails customUserDetails) {
		String id = customUserDetails.getUsername();
		String name = customUserDetails.getNAME();
		
		// 커뮤니티
		commCri.setId(id);
		model.addAttribute("commList", commService.getListno(commCri));
		model.addAttribute("commPageMaker", new MemPageVO(commCri, commService.getCntMember(commCri)));
		
		// 댓글
		cri.setId(id);
		model.addAttribute("replyList", commService.getComment(cri));
		model.addAttribute("replyPageMaker", new PageVO(cri, commService.getCntCmt(cri)));
		
		// 민원
		csCri.setId(id);
		model.addAttribute("csList", csService.listByWriter(csCri));
		
		// 입주자 대표회의
		confCri.setConfWriter(name);
		model.addAttribute("confList", confService.listByWriter(confCri));
		return "myPage/myWrittenList";
	}
	
	@RequestMapping("/admin/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@RequestMapping("/office/office")
	public String office() {
		return "office/office";
	}
	
	@RequestMapping("/resident/resident")
	public String resident() {
		return "resident/resident";
	}
	
}
