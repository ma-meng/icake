<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="col-md-12 gallery-grid glry-two text-right">
            <a href="/list.do?cid=${cid}&pageNum=1" style="color:#666666;"><span class="glyphicon glyphicon-backward"></span></a>
            <a href="/list.do?cid=${cid}&pageNum=${pageInfo.pageNum-1}" style="color:#666666;"><span class="glyphicon glyphicon-chevron-left"></span></a>
            共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
            <a  href="/list.do?cid=${cid}&pageNum=${pageInfo.pageNum+1}" style="color:#666666;"><span class="glyphicon glyphicon-chevron-right"></span></a>
            <a href="/list.do?cid=${cid}&pageNum=${pageInfo.pages}" style="color:#666666;"><span class="glyphicon glyphicon-forward"></span></a>
        </div>
        <div class="gallery-grids">

            <c:forEach items="${pageInfo.list}" var="cake1">
                <div class="col-md-3 gallery-grid">
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
        <div class="col-md-12 gallery-grid glry-two text-right">
            <a href="/list.do?cid=${cid}&pageNum=1" style="color:#666666;"><span class="glyphicon glyphicon-backward"></span></a>
            <a href="/list.do?cid=${cid}&pageNum=${pageInfo.pageNum-1}" style="color:#666666;"><span class="glyphicon glyphicon-chevron-left"></span></a>
            共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
            <a  href="/list.do?cid=${cid}&pageNum=${pageInfo.pageNum+1}" style="color:#666666;"><span class="glyphicon glyphicon-chevron-right"></span></a>
            <a href="/list.do?cid=${cid}&pageNum=${pageInfo.pages}" style="color:#666666;"><span class="glyphicon glyphicon-forward"></span></a>
        </div>
    </div>
</div>
<!--//gallery-->

<jsp:include page="bottom.jsp"/>