package com.lh.app.member.mapper;

import java.util.List;

import com.lh.app.member.domain.MemberCriteria;
import com.lh.app.signIn.domain.MemberVO;

public interface MemberMapper {

	//전체조회
	public List<MemberVO> getList(MemberCriteria cri);
	public int getTotalCount(MemberCriteria cri);
	

	// 0928 추가
	//단건조회
	public MemberVO read(MemberVO vo);
	
	//회원삭제
	public int delete(MemberVO vo);
}
