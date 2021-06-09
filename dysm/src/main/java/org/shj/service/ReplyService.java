package org.shj.service;

import java.util.List;

import org.shj.domain.Criteria;
import org.shj.domain.ReplyPageDTO;
import org.shj.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long qno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long qno);
	
}