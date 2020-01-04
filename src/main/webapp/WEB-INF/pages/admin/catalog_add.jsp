<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 添加分类</h2>
                <p class="lead"></p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form method="post" action="/admin/Catalog/add.do" id="admin-form">
                        <div class="panel-body bg-light">
                            <div class="section row">
                                <div>
                                    <div class="col-md-3"><b>分类编号</b></div>
                                    <div class="col-md-5"><b>分类名称</b></div>
                                    <div class="col-md-3"><b>所属父类</b></div>
                                    <div class="col-md-1" style="text-align:right;"><b>删除</b></div>
                                </div>
                            </div>
                            <div class="section row" id="batch_items">
                                <div>
                                    <div class="col-md-3">
                                        <label for="title" class="field prepend-icon">
                                            <input type="text" name="title" id="title" class="gui-input money" placeholder="名称..." required>
                                            <label for="title" class="field-icon">
                                                <i class="fa fa-stack"></i>
                                            </label>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="field select">
                                            <select id="language" name="pid">
                                                <option value="${root.id}">${root.title}</option>
                                                <c:forEach items="${root.children}" var="cat1">
                                                    <option value="${cat1.id}">&nbsp;&nbsp;&nbsp;&nbsp;${cat1.title}</option>
                                                    <c:forEach items="${cat1.children}" var="cat2">
                                                        <option value="${cat2.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cat2.title}</option>
                                                    </c:forEach>
                                                </c:forEach>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="info" class="field prepend-icon">
                                            <input type="text" name="info" id="info" class="gui-input" placeholder="描述...">
                                            <label for="info" class="field-icon">
                                                <i class="fa fa-info"></i>
                                            </label>
                                        </label>
                                    </div>
                                    <div class="col-md-1" style="text-align:right;">
                                        <button type="button" class="button remove_item_button"> X </button>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer text-right">
                                <button type="button" class="button" id="add_item_button"> 添加 </button>
                                <button type="submit" class="button"> 保存 </button>
                                <button type="button" class="button" onclick="javascript:window.location.href='/admin/Catalog/list.do';"> 返回 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>

<jsp:include page="bottom.jsp"/>

<script>
    $("#add_item_button").click(function(){
        $("#batch_items").children("div").last().after($("#batch_items").children("div").first().clone());
        $("#batch_items").find("button.remove_item_button").attr("disabled",false);
        $("#batch_items").children("div").last().find("input").eq(0).attr("value","");
        $("#batch_items").children("div").last().find("button.remove_item_button").click(
            function(){itemRemove(this);}
        );
    });
    function itemRemove(ele){
        $(ele).parent().parent().remove();
        if($("#batch_items").children("div").size()==1){
            $("#batch_items").children("div").find("button.remove_item_button").attr("disabled",true);
        }
    }
</script>