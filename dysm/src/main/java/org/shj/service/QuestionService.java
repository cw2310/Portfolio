package org.shj.service;

import java.util.List;

import org.shj.domain.Criteria;
import org.shj.domain.QuestionVO;

public interface QuestionService {

	public List<QuestionVO> getList(Criteria cri); // 문의사항
	
	public int getTotal(Criteria cri); // 총 페이지 수
	
	public void register(QuestionVO quesion); // 글쓰기
	
	public QuestionVO get(Long qno); // 작성글 보기
	
	public boolean modify(QuestionVO question); // 글 수정
	
	public boolean remove(Long qno); // 글 삭제
	
}
