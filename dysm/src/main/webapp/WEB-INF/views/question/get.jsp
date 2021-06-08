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
			<br><br><hr><br>
		</div>
	</div>

</section>

<script type="text/javascript">
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
})
</script>

<%@ include file="../includes/footer.jsp" %>

