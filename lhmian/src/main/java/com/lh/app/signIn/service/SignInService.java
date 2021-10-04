package com.lh.app.signIn.service;

import com.lh.app.signIn.domain.GenerationVO;
import com.lh.app.signIn.domain.MemberVO;
import com.lh.app.signIn.etc.CustomUserDetails;

public interface SignInService {
	//id 중복체크
	public int idCheck(MemberVO vo);	
	
	//세대원 인증 키 확인
	public GenerationVO authKey(GenerationVO vo);
	
	//회원가입. 회원 테이블에 회원정보 등록
	public int insert(MemberVO vo);
	
	//아이디 찾기
	public MemberVO findId(MemberVO vo);
	
	//비밀번호 찾기
	public int findPassword(MemberVO vo);
	
	//비밀번호 변경
	public int updatePassword(MemberVO vo);
	
	//smsAPI
	public String smsAPI(String phone);
	
	//카카오 로그인시, 회원가입 이력 조회
	public int kakaoIdCheck(Integer id);
	
	//id로 회원조회
	public MemberVO memberSelect(MemberVO vo);
}
