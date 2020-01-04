<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 蛋糕管理</h2>
                <p class="lead"></p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel  heading-border">
                    <div class="panel-menu">
                        <div class="row">
                            <div class="hidden-xs hidden-sm col-md-3">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default light">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                    <button type="button" class="btn btn-default light">
                                        <i class="fa fa-plus" onclick="javascript:window.location.href='/admin/Cake/toAdd.do';"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-9 text-right">
                                <form action="/admin/Cake/list.do" method="post">
                                    共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
                                    <div class="btn-group">
                                        <button type="submit" name="pageNum" value="${pageInfo.pageNum-1}" class="btn btn-default light">
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button type="submit" name="pageNum" value="${pageInfo.pageNum+1}" class="btn btn-default light">
                                            <i class="fa fa-chevron-right"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                            <thead>
                            <tr class="">
                                <th class="text-center hidden-xs">Select</th>
                                <th class="hidden-xs">名称</th>
                                <th class="hidden-xs">类型</th>
                                <th class="hidden-xs">价格</th>
                                <th class="hidden-xs">口味</th>
                                <th class="hidden-xs">尺寸</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="cake">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="FR">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${cake.title}</td>
                                <td>${cake.catalog.title}</td>
                                <td>${cake.price}</td>
                                <td>${cake.taste}</td>
                                <td>${cake.size}</td>
                                <td>
                                    <a href="/admin/Cake/detail.do?id=${cake.id}">查看</a>
                                    <a href="/admin/Cake/toEdit.do?id=${cake.id}">编辑</a>
                                    <a href="/admin/Cake/remove.do?id=${cake.id}">删除</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>