package org.shj.mapper;

import org.shj.domain.MemberVO;

public interface MemberMapper {

	public void insert(MemberVO member); // 회원가입
	
	public int idDuplication(String id); // ID 중복확인
	
	public MemberVO login(MemberVO member); // 로그인
	
	public MemberVO getPersonal(String id); // 개인정보
	
	public int update(MemberVO member); // 개인정보 수정
	
	public int delete(MemberVO member); // 회원탈퇴
	
}
