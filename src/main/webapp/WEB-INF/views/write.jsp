<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section>
	<div class="board">
		<h1 class="boardTitle">게시판</h1>
		<form method="POST">
			<div class="boardList">
				<div class="boardLine">
					<div class="title">
						<input type="text" name="title" placeholder="제목" size="60" autofocus>
					</div>
					
					<div class="writer">
						<input type="hidden" name="member" value="${not empty login }">
						<c:if test="${not empty login }">
							<input type="hidden" name="writer" value="${login.username }">
							<strong>${login.username }</strong>
						</c:if>
						<c:if test="${empty login }">
							<input type="text" name="writer" placeholder="작성자" size="13">
						</c:if>
					</div>
					
				</div>
				<div class="boardContent">
					<textarea name="context" rows="25" cols="85" placeholder="내용을 작성하세요"></textarea>
				</div>
			</div>

			<div class="boardMenu">
				<div class="leftMenu">
					<input class="btn" type="button" value="돌아가기"
						onclick="history.go(-1)">
				</div>

				<div class="rightMenu">
					<input class="btn" type="submit" value="작성">
				</div>
			</div>
		</form>
	</div>
</section>

<%@ include file="footer.jsp"%>