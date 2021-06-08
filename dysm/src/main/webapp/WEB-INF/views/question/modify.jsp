<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<section id="question-modify-section">
	
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-lg-12">
					<h1>수정</h1>
					<br><br><hr><br><br>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							
							<form role="form" method="post" action="/question/modify">
							
							<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
							<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
							<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
							<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
							
								<div class="form-group">
									<label>qno</label> <input class="form-control" name="qno"
										value="<c:out value='${question.qno}'/>" readonly>
								</div>
								
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="title"
										value="<c:out value='${question.title}'/>">
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="4" name="content">
									<c:out value='${question.content}'/></textarea>
								</div>
								
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer"
										value="<c:out value='${question.writer}'/>" readonly>
								</div>

								<div class="form-group">
									<label>작성일</label> <input class="form-control" name="wriDate"
										value="<fmt:formatDate pattern = 'yyyy/MM/dd' value='${question.wriDate}'/>" readonly>
								</div>
 								
								<div class="form-group">
									<label>수정일</label> <input class="form-control" name="updateDate"
										value="<fmt:formatDate pattern = 'yyyy/MM/dd' value='${question.updateDate}'/>" readonly>
								</div>
 
								<button type="submit" data-oper="modify" class="btn btn-primary">
									수정</button>
								<button type="button" data-oper="remove" class="btn btn-danger">
									삭제</button>
								<button type="button" data-oper="list" class="btn btn-success">
									목록</button>
							</form>
			
						</div>
						<!-- end panel-body -->
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

<script>
$(document).ready(function(){

	var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault();
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/question/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/question/list").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
      }
// 	    else if(operation === 'modify'){
//     	  formObj.attr("action", "/question/modify").attr("method","post");
//       }
	   formObj.submit();
		
	})
})
</script>

<%@ include file="../includes/footer.jsp" %>

