package org.shj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.shj.domain.Criteria;
import org.shj.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long qno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("qno") Long qno);
	
	public int getCountByQno(Long qno);
}
