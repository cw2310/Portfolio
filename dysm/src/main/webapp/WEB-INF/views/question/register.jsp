<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<section id="question-register-section">

	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">글쓰기</h1>
					<br><br><hr><br><br>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					
						<div class="panel-heading"></div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							
							<form role="form" action="/question/register" method="post">
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="title">
									<br><br>
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" name="content"></textarea>
									<br><br>
								</div>
								
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer" value="${memberId}" readonly>
									<br><br>
								</div>
								
								<button type="submit" class="input-group-text">등록</button>
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

<%@ include file="../includes/footer.jsp"%>