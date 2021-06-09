package org.shj.service;

import java.util.List;

import org.shj.domain.Criteria;
import org.shj.domain.ReplyPageDTO;
import org.shj.domain.ReplyVO;
import org.shj.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	public int register(ReplyVO vo) {
		
		log.info("register......" + vo);
		
		return mapper.insert(vo);
	}

	public ReplyVO get(Long rno) {
		
		log.info("get......" + rno);
		
		return mapper.read(rno);
	}

	public int modify(ReplyVO vo) {
		
		log.info("modify......" + vo);
		return mapper.update(vo);
	}

	public int remove(Long rno) {
		
		log.info("remove...." + rno);;
		
		return mapper.delete(rno);
	}

	public List<ReplyVO> getList(Criteria cri, Long qno) {
		
		log.info("get Reply List of a Board " + qno);
				
		return mapper.getListWithPaging(cri, qno);
	}
	
	public ReplyPageDTO getListPage(Criteria cri, Long qno) {
		
		return new ReplyPageDTO(
				mapper.getCountByQno(qno),
				mapper.getListWithPaging(cri, qno));
	}

}
