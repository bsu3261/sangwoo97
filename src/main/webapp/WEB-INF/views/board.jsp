<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<div class="board">
		<h1 class="boardTitle">게시판</h1>
		
		<div class="boardList">
			<c:if test="${empty list }">
			<div>
				<div class="msg">
				<h1>검색결과가 없습니다</h1>
				<button class="btn" onclick="location.replace('${pageContext.request.contextPath}/board/searchInit/')">돌아가기</button>
				</div>
			</div>
			</c:if>
			<c:forEach var="vo" items="${list }">
				<div class="boardLine">
					<div class="num">${vo.num }</div>
					<div class="title">
						<a href="${cpath }/board/read/${vo.num }/">${vo.title }</a>
					</div>
					<div class="writer">${vo.writer }</div>
					<div class="time">${vo.time }</div>
					<div class="ipaddr">${vo.ipaddr}</div>
					<div class="views">${vo.views}</div>
				</div>
			</c:forEach>
		</div>

		<div class="paging">
			<c:if test="${prev }">
				<a href="${cpath }/board/${begin - 1}/">◀ </a>
			</c:if>
			<c:forEach var="i" begin="${begin}" end="${end}">
			<c:if test="${i == page }">
				<strong>[${i }]</strong>
			</c:if>
			<c:if test="${i != page }">
				<a href="${cpath }/board/${i }/">
			 		[${i }]
				</a>
			</c:if>
			</c:forEach>
			<c:if test="${next }">
				<a href="${cpath }/board/${end + 1}/">▶</a>
			</c:if>
		</div>

		<div class="boardMenu">
			<div class="leftMenu">
				<form method="POST" action="${cpath }/board/">
					<select name="searchType">
						<option value="title" ${bp.searchType == 'title' ? 'selected' : '' }>제목</option>
						<option value="writer" ${bp.searchType == 'writer' ? 'selected' : '' }>작성자</option>
						<option value="content" ${bp.searchType == 'content' ? 'selected' : '' }>내용</option>
						<option value="num" ${bp.searchType == 'num' ? 'selected' : '' }>글번호</option>
					</select> <input type="text" name="searchWord" value="${bp.searchWord }">
					<input class="btn" type="submit" value="검색">
					<input class="btn" type="button" value="검색 초기화" onclick="location.replace('${pageContext.request.contextPath}/board/searchInit/')">
				</form>
			</div>

			<div class="rightMenu">
				<input class="btn" type="button" value="새 글 쓰기" onclick="location.replace('${cpath}/board/write/')">
			</div>
		</div>
	</div>
</section>

<%@ include file="footer.jsp"%>