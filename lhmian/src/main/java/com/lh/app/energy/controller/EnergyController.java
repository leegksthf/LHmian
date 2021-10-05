package com.lh.app.energy.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lh.app.energy.domain.EnergyVO;
import com.lh.app.energy.service.EnergyService;
import com.lh.app.signIn.etc.CustomUserDetails;

@Controller
public class EnergyController {

	@Autowired
	EnergyService energyService;

	// 전체조회-사용자
	@GetMapping("/myPage/myEnergyCon")
	public void myList(EnergyVO vo, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		vo.setHouseInfo(Integer.parseInt(customUserDetails.getHOUSEINFO()));
		model.addAttribute("engList", energyService.getList(vo));
		
		Gson gson = new Gson();

		
		model.addAttribute("read", gson.toJson(energyService.read(vo)));
	}

	// 단건 조회-사용자
	@GetMapping("/myEnergy")
	@ResponseBody
	public String myRead(EnergyVO vo, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		vo.setHouseInfo(Integer.parseInt(customUserDetails.getHOUSEINFO()));
		
		Gson gson = new Gson();
		
		String result = String.valueOf(gson.toJson(energyService.read(vo)));
		System.out.println(gson.toJson(energyService.read(vo)));
		return result;
	}

	// 전체조회-관리자
	@GetMapping("/admin/admEnergyCon")
	@ResponseBody
	public void admList(EnergyVO vo, Model model) {
		model.addAttribute("admList", energyService.getList(vo));
	}

	// 단건 조회-관리자
	@GetMapping("/admEnergy")
	@ResponseBody
	public String admRead(EnergyVO vo, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		vo.setHouseInfo(Integer.parseInt(customUserDetails.getHOUSEINFO()));
		
		Gson gson = new Gson();
		
		String result = gson.toJson(energyService.read(vo));
		
		return result;
	}

	// 테스트페이지
	@GetMapping("/no/test")
	public void test(EnergyVO vo, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		vo.setHouseInfo(Integer.parseInt(customUserDetails.getHOUSEINFO()));
		model.addAttribute("engList", energyService.getList(vo));
	}
}
