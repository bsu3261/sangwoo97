<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
<script>
    function deleteConfirm() {
        var answer = confirm('${vo.num} 번 글을 정말 삭제하시겠습니까?');
        if (answer == true) {
            location.href = "${pageContext.request.contextPath}/board/delete/${vo.num }/";
        }
    }
</script>
<div class="board" >
    <h1 class="boardTitle">게시판</h1>
    <div class="boardList">
           <div class="boardLine" style="border: 0;">
               <div class="num">${vo.num }</div>
               <div class="title">${vo.title }</div>
               <div class="writer">${vo.writer }</div>
               <div class="time">${vo.time }</div>
               <div class="time">${vo.ipaddr }</div>
           </div>
           <div class="boardContent" style="border: 1px solid #dadada">
               <textarea disabled>${vo.context }</textarea>
           </div>
           <div class="reply" style="border: 1px solid red; width="1100">
           		<c:forEach var="reply" items="${replyList }">
           		<div class="replyRow">
           			<div class="writer"><strong>${reply.writer }</strong></div>
           			<div class="time">
           				<fmt:formatDate value="${reply.time }" pattern="yyyy-MM-dd hh:mm:ss"/>
           			</div>
           			<div class="context">${reply.context }</div>
<!--            			<div class="btndiv"> -->
<!--            				<button>수정</button> -->
<!--            				<button>삭제</button> -->
           			</div>
           		</c:forEach>
           		
           		</div>
           </div>
           <!--  댓글 입력 폼 -->
           <div class="replyForm" style="border: 1px solid blue">
           <form method="POST">
           		<textarea name ="context" style="resize: none" rows="5" cols="60"
           				placeholder="불쾌감을 유발하는 내용은 삭제될 수 있습니다"></textarea>
           				<input name="writer" placeholder="작성자">
           				<input type="submit" value="전송">
           </form>
           </div>
           
    </div>

    <div class="boardMenu">
        <div class="leftMenu">
<%--         <c:if test="${ vo.writer eq login.username }"> --%>
            <input class="btn" type="button" value="수정" onclick="location.replace('${pageContext.request.contextPath}/update.jsp?num=${vo.num }')">
            <input class="btn" type="button" value="삭제" onclick="deleteConfirm()">
<%--         </c:if> --%>
        </div>         
        <div class="rightMenu">
            <input class="btn" type="button" value="목록보기" onclick="history.go(-1);">
        </div>
    </div>
</div>
</section>

<%@ include file="footer.jsp" %>