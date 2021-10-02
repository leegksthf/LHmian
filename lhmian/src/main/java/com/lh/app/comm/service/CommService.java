package com.lh.app.comm.service;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.lh.app.comm.domain.CommVO;
import com.lh.app.comm.domain.Criteria;
import com.lh.app.signIn.etc.CustomUserDetails;

public interface CommService {
	// CRUD
	// 등록
	public int insert(CommVO vo);

	// 수정
	public int update(CommVO vo);

	// 삭제
	public int remove(Long commNo);

	// 단건 조회
	public CommVO read(CommVO vo);

	// 전체 조회
	public List<CommVO> getList(Criteria cri);
	
	// 10/02 cri 주석처리함
	// 마이페이지 게시글 조회
	public List<CommVO> getListno(/* Criteria cri, */String username);

	public int getTotalCount(Criteria cri);

	// 댓글 수 업데이트
	public void updateReplycnt();

	// 댓글 수 업데이트
	public int viewCount(Long commNo);

}
