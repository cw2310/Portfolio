package org.shj.service;

import org.shj.domain.MemberVO;

public interface MemberService {
	
	public void insert(MemberVO member); // 회원가입
	
	public boolean idDuplication(String id); // ID 중복확인
	
	public MemberVO login(MemberVO member); // 로그인
	
	public MemberVO getPersonal(String id); // 개인정보
	
	public boolean modify(MemberVO member); // 개인정보 수정
	
	public boolean remove(MemberVO member); // 회원탈퇴
	
}
