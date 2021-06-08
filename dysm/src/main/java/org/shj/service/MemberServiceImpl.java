package org.shj.service;

import org.shj.domain.MemberVO;
import org.shj.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	public void insert(MemberVO member) { // 회원가입
		log.info("MemberServiceImpl>insert>>"+member);
		
		mapper.insert(member);
	}
	
	public boolean idDuplication(String id) { // 아이디 중복이면 true
		log.info("MemberServiceImpl>idDuplication>>"+id);
		
		if(mapper.idDuplication(id) == 0)
			return false;
		else
			return true;
	}
	
	public MemberVO login(MemberVO member) { // 로그인		
		log.info("MemberServiceImpl>login>>"+member);
		
		return mapper.login(member);
	}
	
	public MemberVO getPersonal(String id) { // 개인정보
		log.info("MemberServiceImpl>getPersonal>> "+id);
		
		return mapper.getPersonal(id);
	}
	
	public boolean modify(MemberVO member) { // 개인정보 수정
		log.info("MemberServiceImpl>modify>>"+member);
		
		if(mapper.update(member) == 1)
			return true;
		else
			return false;
	}
	
	public boolean remove(MemberVO member) { // 회원탈퇴
		log.info("MemberServiceImpl>remove>>"+member);
		
		if(mapper.delete(member)==1)
			return true;
		else
			return false;
	}
	
}
