package org.shj.mapper;

import java.util.List;

import org.shj.domain.Criteria;
import org.shj.domain.QuestionVO;

public interface QuestionMapper {

	public void insertSelectKey(QuestionVO question);
	
	public QuestionVO read(Long qno);
	
	public int update(QuestionVO question);
	
	public int delete(Long qno);
	
	public List<QuestionVO> getList();
	
	public List<QuestionVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri); 
	
}
