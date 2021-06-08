package org.shj.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	
	private long qno;
	private String title;
	private String content;
	private String writer;
	private Date wriDate;
	private Date updateDate;
	
}
