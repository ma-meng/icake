<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<!--banner-->
<div class="banner">
    <div class="container">
        <h2 class="hdng">IMOOC <span>蛋糕</span></h2>
        <p>特别的日子，特别的你</p>
        <a href="/detail.do?id=${cake.id}">SHOP NOW</a>
        <div class="banner-text">
            <img src="${cake.imagePath}" alt=""/>
        </div>
    </div>
</div>
<!--//banner-->

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="gallery-grids">

            <c:forEach items="${list}" var="cake1" varStatus="sta">
                <c:if test="${sta.index==0}"><div class="col-md-8 gallery-grid glry-one"></c:if>
                <c:if test="${sta.index==1}"><div class="col-md-4 gallery-grid glry-two"></c:if>
                <c:if test="${sta.index>1}"><div class="col-md-3 gallery-grid"></c:if>
                <a href="#"><img src="${cake1.imagePath}" class="img-responsive" alt=""/>
                    <div class="gallery-info">
                        <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> view</p>
                        <a class="shop" href="/detail.do?id=${cake1.id}">SHOP NOW</a>
                        <div class="clearfix"> </div>
                    </div>
                </a>
                <div class="galy-info">
                    <p>${cake1.title}</p>
                    <div class="galry">
                        <div class="prices">
                            <h5 class="item_price">$${cake1.price}</h5>
                        </div>
                        <div class="detail_xing">
                            <c:forEach begin="1" end="5" var="ind">
                                <c:if test="${cake1.sweetness>=ind}">
                                    <span class="glyphicon glyphicon-star"></span>
                                </c:if>
                                <c:if test="${cake1.sweetness<ind}">
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!--//gallery-->
<jsp:include page="bottom.jsp"/>