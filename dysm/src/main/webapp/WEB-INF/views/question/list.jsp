<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<section id="question-list-section">

	<div class="container-fluid">
		<div class="content">
			<h1>문의사항</h1>
			<br><br><hr><br><br>
			<div class="row">
				<div class="col-md-12">
				
					<table class="table table-hover table-sm">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${list}" var="question">
								<tr>
									<td><c:out value="${question.qno}"/></td>
									<td><a class="move" href="/question/get?qno=<c:out value='${question.qno}'/>
																			&writer=<c:out value='${question.writer}'/>">
										<c:out value="${question.title}"/></a></td>
									<td><c:out value="${question.writer}"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${question.wriDate}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<c:if test="${!empty member}">
						<form method="get" action="/question/register">
							<button class="input-group-text">글쓰기</button>
						</form>
					</c:if>
					
					<div class="pull-right">
			       	<ul class="pagination">
			       		
			       		<c:if test="${pageMaker.prev}">
			       			<li class="paginate_button previous">
			       				<a href="${pageMaker.startPage-1}">Previous</a>
			       			</li>
			       		</c:if>
			       		
			       	<!-- begin 부터 end 까지 반복 -->
			        	<c:forEach var="num" begin="${pageMaker.startPage}"
			        		end="${pageMaker.endPage}">&nbsp;
			        		<li class="paginate_button ${pageMaker.cri.pageNum == num? 'active':''}">
			        			&nbsp;<a href="${num}">${num}</a>&nbsp;
			        		</li>
			        	</c:forEach>
			        	
	         &nbsp;<c:if test="${pageMaker.next}">
			        		<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
			        	</c:if>
			        </ul>
			       </div>
			       
			       <form id="actionForm" action="/question/list" method="get">
	            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	            	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	           	 </form>
					
				</div>
			</div>
			<br><br><hr><br>
		</div>
	</div>
	
	
</section>

<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault(); // a태그의 default 이벤트 봉인!
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
	
})

</script>

<%@ include file="../includes/footer.jsp"%>


