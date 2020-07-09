<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
        
<div class="sliderDiv" style="margin-left: auto; margin-right: auto;">
    <ul class="bxslider">
        <c:forEach var="i" begin="1" end="9">
        <li style="height: 500px; text-align: center;">
            <div style="background-image: url('img/${i}.jpg');"></div></li>
        </c:forEach>
    </ul>
</div>

<div class="container underSlide">
    <article class="album"><h2>ALBUM</h2></article>
    <article class="board"><h2>BOARD</h2></article>
    <article class="youtube"><h2>YouTube</h2></article>
</div>

<script>
    $(document).ready(function(){
        $('.bxslider').bxSlider(
            {
                auto: true,
                speed: 1500,
                pause: 3000,
                mode: 'fade', // fade, vertical, horizontal
                autoControls: false, // 시작 중지 버튼 보여줄지 여부
                pager: true,        // 하단 페이지 모양 출력 여부
            }
        );
        $('.bx-wrapper').css('border', '0px');
        
    });
</script>

</section>
<%@ include file="footer.jsp" %>    
    
</body>
</html>