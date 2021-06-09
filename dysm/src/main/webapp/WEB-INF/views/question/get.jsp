<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<section id="question-get-section">

	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-lg-12">
					<h1>문의사항</h1>
					<br><br><hr><br><br>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
								value="<c:out value='${question.title}'/>" readonly>
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="content"
								readonly><c:out value='${question.content}'/></textarea>
						</div>
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
								value="<c:out value='${question.writer}'/>" readonly>
						</div><br>
						
						<button type="button" data-oper="modify" class="btn btn-primary"
							onclick="location.href='/question/modify?qno=<c:out value="${question.qno}"/>'">
							수정
						</button>
						<button type="button" data-oper="list" class="btn btn-success"
							onclick="location.href='/question/list'">
							목록
						</button>
						
						<form id="operForm" action="/question/modify" method="get">
							<input type="hidden" id="qno" name="qno" value="<c:out value='${question.qno}'/>">
							<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
							<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
							<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
							<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
						</form>
			
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel -->
			</div>
			<!-- /.row -->
			
			<!-- reply -->
			<div class = 'row'>
				<div class="col-lg-12">
				
					<!-- /.panel -->
					<div class="panel panel-default">
			<!-- 			<div class="panel-heading"> -->
			<!-- 				<i class="fa fa-comments fa-fw"></i> Reply -->
			<!-- 			</div> -->
						
						 <div class="panel-heading">
						 <i class="fa fa-comments fa-fw"></i> Reply
						 	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
						 </div>
						 
						<!-- /.panel-heading -->
						<div class='panel-body'>
						
							<ul class="chat">
								<!-- start reply -->
								<li class="left clearfix" data-rno='12'>
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong>
											<small class="pull-right text-muted">2018-01-01 13:13 </small>
										</div>
										<p>Good job!</p>
									</div>
								</li>
								<!-- test -->
								<li class="left clearfix" data-rno='12'>
									<div>
										<div class="header">
											<strong class="primary-font">${replyer }</strong>
											<small class="pull-right text-muted">${rno } </small>
										</div>
										<p>Good job!</p>
									</div>
								</li>
							<!-- end reply -->
							</ul>
							<!-- ./ end ul -->
						</div>
						<!-- /.panel .chat-panel -->
						<div class="panel-footer"></div>
					</div>
				</div>
				<!-- ./ end row -->
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Reply</label>
								<input class="form-control" name='reply' value='newReply!!!!'>
							</div>
							<div class="form-group">
								<label>Replyer</label>
								<input class="form-control" name='replyer' value='Replyer'>
							</div>
							<div class="from-group">
								<label>Reply Date</label>
								<input class="form-control" name='replyDate' value=''>
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
							<button id='modalRegisterBtn' type="button" class="btn btn-primary" data-dismiss="modal">Register</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
			<br><br><hr><br>
		</div>
	</div>

</section>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
$(document).ready(function(){
	
	var operForm = $("#operForm")
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/question/modify").submit()
	});
	
	$("button[data-oper='list']").on("click",function(e){
		operForm.find("#qno").remove()
		operForm.attr("action","/question/list")
		operForm.submit()
	})

	
	
// 댓글 *****************************************************************

	var qnoValue = '<c:out value="${question.qno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page){
		
		console.log("show list " + page);
		
		replyService.getList({qno:qnoValue, page: page|| 1}, function(replyCnt, list){
			console.log("replyCnt: " + replyCnt);
			console.log("list: " + list);
			console.log(list);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			
			if(list == null || list.length == 0){
				return;
			}
			
			for(var i = 0, len = list.length || 0; i < len; i++){
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="    <div><div class='header'><strong class='primary-font'>["+list[i].rno+"] "+list[i].replyer+"</strong>";
				str +="        <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="        <p>"+list[i].reply+"</p></div></li>";	
			}

			replyUL.html(str);
			
			showReplyPage(replyCnt);
				
		}) //end function

	} //end showList
	
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum -9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum; i<= endNum; i++){
			
			var active = pageNum == i? "active":"";
			
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum+ 1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
	
		var targetPageNum = $(this).attr("href");
	
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	})
	
	
	// 새로운 댓글 추가 시작 시 이벤트 처리
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    });
	
	$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		
		modalInputReplyer.removeAttr("readonly"); // 내가 추가함
		
		$(".modal").modal("show");
		
	})
	
	// 새로운 댓글 추가 완료 시 이벤트 처리
	modalRegisterBtn.on("click", function(e){
		
		var reply = {
				reply: modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				qno:qnoValue
		};
		replyService.add(reply, function(result){
			
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			// showList(1); // 결과 확인 위해 갱신
			showList(-1); // 전체 댓글 숫자 파악
		})
	})
	
	// 댓글 클릭 이벤트 처리
	$(".chat").on("click", "li", function(e){
		
		var rno = $(this).data("rno");
	
		replyService.get(rno, function(reply){
		
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyer.val(reply.replyer)
			.attr("readonly", "readonly"); // 내가 추가함
			modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
			.attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		
		})
	})
	
	// 댓글 수정 (Modify 클릭)
	modalModBtn.on("click", function(e){
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		
		replyService.update(reply, function(result){
			
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		
		})
	})
	
	// 댓글 삭제 (Remove 클릭)
	modalRemoveBtn.on("click", function(e){
		
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
			
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		})
	})
})
</script>

<%@ include file="../includes/footer.jsp" %>

