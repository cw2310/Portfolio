package org.shj.service;

import java.util.List;

import org.shj.domain.Criteria;
import org.shj.domain.QuestionVO;
import org.shj.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QuestServiceImpl implements QuestionService {
	@Setter(onMethod_= {@Autowired})
	private QuestionMapper mapper;
	
	public List<QuestionVO> getList(Criteria cri){
		log.info("serviceImpl/getList:"+cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	public int getTotal(Criteria cri) {
		log.info("ServiceImpl/getTotal:count>> ");
		
		return mapper.getTotalCount(cri);
	}
	
	public void register(QuestionVO question) {
		log.info("ServiceImpl/register>> "+question);
		
		mapper.insertSelectKey(question);
	}
	
	public QuestionVO get(Long qno) {
		log.info("ServiceImpl/get or modify");
		
		return mapper.read(qno);
	}
	
	public boolean modify(QuestionVO question) {
		log.info("ServiceImpl/modify>> "+question);
		
		return (mapper.update(question)==1);
	}
	
	public boolean remove(Long qno) {
		log.info("ServiceImpl/remove>> ");
		
		return (mapper.delete(qno) == 1);
	}

	
}
