<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 编辑商品</h2>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form method="post" action="/admin/Cake/edit.do" enctype="multipart/form-data" id="admin-form">
                        <input type="hidden" name="id" value="${cake.id}" />
                        <div class="panel-body bg-light">
                            <div class="section row">
                                <div class="col-md-1" style="margin-top: 10px;"><b>名称</b></div>
                                <div class="col-md-5">
                                    <label for="title" class="field prepend-icon">
                                        <input type="text" name="title" value="${cake.title}" id="title" class="gui-input" placeholder="名称..." required>
                                        <label for="title" class="field-icon">
                                            <i class="fa fa-navicon"></i>
                                        </label>
                                    </label>
                                </div>
                                <div class="col-md-1" style="margin-top: 10px;"><b>状态</b></div>
                                <div class="col-md-3" style="margin-top: 10px;">
                                    <input type="radio" name="status" id="status1" class="radio" value="" <c:if test="${cake.status==''}">checked</c:if> />
                                    <label for="status1">普通</label>
                                    <input type="radio" name="status" id="status2" class="radio" value="推荐" <c:if test="${cake.status=='推荐'}">checked</c:if>/>
                                    <label for="status2">推荐</label>
                                    <input type="radio" name="status" id="status3" class="radio" value="特卖" <c:if test="${cake.status=='特卖'}">checked</c:if>/>
                                    <label for="status3">特卖</label>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-1" style="margin-top: 10px;"><b>图片</b></div>
                                <div class="col-md-1" id="showImage"></div>
                                <div class="col-md-7">
                                    <input type="hidden" name="imagePath" value="${cake.imagePath}" />
                                    <input type="file" name="image" id="image" class="gui-file" placeholder="图片...">
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-1" style="margin-top: 10px;"><b>所属分类</b></div>
                                <div class="col-md-2">
                                    <label class="field select">
                                        <select id="language" name="cid">
                                            <c:forEach items="${root.children}" var="cat1">
                                                <c:forEach items="${cat1.children}" var="cat2">
                                                    <c:forEach items="${cat2.children}" var="cat3">
                                                        <c:if test="${cat3.id==cake.cid}">
                                                            <option value="${cat3.id}" selected>${cat1.title}->${cat2.title}->${cat3.title}</option>
                                                        </c:if>
                                                        <c:if test="${cat3.id!=cake.cid}">
                                                            <option value="${cat3.id}">${cat1.title}->${cat2.title}->${cat3.title}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </c:forEach>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                                <div class="col-md-1" style="margin-top: 10px;"><b>口味</b></div>
                                <div class="col-md-2">
                                    <label for="taste" class="field prepend-icon">
                                        <input type="text" name="taste" value="${cake.taste}" id="taste" class="gui-input" placeholder="口味..." required>
                                        <label for="taste" class="field-icon">
                                            <i class="fa fa-coffee"></i>
                                        </label>
                                    </label>
                                </div>
                                <div class="col-md-1" style="margin-top: 10px;"><b>甜度</b></div>
                                <div class="col-md-2">
                                    <label for="sweetness" class="field prepend-icon">
                                        <input type="number" name="sweetness"  value="${cake.sweetness}" id="sweetness" class="gui-input" placeholder="甜度..." required min="1" max="5" value="3">
                                        <label for="sweetness" class="field-icon">
                                            <i class="fa fa-star"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-1" style="margin-top: 10px;"><b>价格</b></div>
                                <div class="col-md-2">
                                    <label for="price" class="field prepend-icon">
                                        <input type="text" name="price" value="${cake.price}" id="price" class="gui-input" placeholder="价格..." required>
                                        <label for="price" class="field-icon">
                                            <i class="fa fa-cny"></i>
                                        </label>
                                    </label>
                                </div>
                                <div class="col-md-1" style="margin-top: 10px;"><b>重量</b></div>
                                <div class="col-md-2">
                                    <label for="weight" class="field prepend-icon">
                                        <input type="number" name="weight" value="${cake.weight}" id="weight" class="gui-input" placeholder="重量..." required>
                                        <label for="weight" class="field-icon">
                                            <i class="fa fa-database"></i>
                                        </label>
                                    </label>
                                </div>
                                <div class="col-md-1" style="margin-top: 10px;"><b>尺寸</b></div>
                                <div class="col-md-2">
                                    <label for="size" class="field prepend-icon">
                                        <input type="number" name="size" value="${cake.size}" id="size" class="gui-input" placeholder="尺寸..." required>
                                        <label for="size" class="field-icon">
                                            <i class="fa fa-arrows"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-1" style="margin-top: 10px;"><b>材料</b></div>
                                <div class="col-md-8">
                                    <label for="material" class="field prepend-icon">
                                        <input type="text" name="material" value="${cake.material}" id="material" class="gui-input" placeholder="材料..." required>
                                        <label for="material" class="field-icon">
                                            <i class="fa fa-server"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.location.href='/admin/Cake/list.do';"> 返回 </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>