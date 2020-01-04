<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
    <section id="content_wrapper">
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="content-header">
                    <h2> 分类管理</h2>
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
                                            <i class="fa fa-plus" onclick="javascript:window.location.href='/admin/Catalog/toAdd.do';"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body pn">
                            <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                                <thead>
                                <tr class="">
                                    <th class="text-center hidden-xs">Select</th>
                                    <th class="hidden-xs">名称</th>
                                    <th class="hidden-xs">描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${root.children}" var="cat1">
                                <tr class="message-unread">
                                    <td class="hidden-xs">
                                        <label class="option block mn">
                                            <input type="checkbox" name="mobileos" value="FR">
                                            <span class="checkbox mn"></span>
                                        </label>
                                    </td>
                                    <td>${cat1.title}</td>
                                    <td>${cat1.info}</td>
                                    <td>
                                        <a href="/admin/Catalog/remove.do?id=${cat1.id}">删除</a>
                                    </td>
                                </tr>
                                    <c:forEach items="${cat1.children}" var="cat2">
                                        <tr class="message-unread">
                                            <td class="hidden-xs">
                                                <label class="option block mn">
                                                    <input type="checkbox" name="mobileos" value="FR">
                                                    <span class="checkbox mn"></span>
                                                </label>
                                            </td>
                                            <td style="padding-left: 50px;">${cat2.title}</td>
                                            <td>${cat2.info}</td>
                                            <td>
                                                <a href="/admin/Catalog/remove.do?id=${cat2.id}">删除</a>
                                            </td>
                                        </tr>
                                        <c:forEach items="${cat2.children}" var="cat3">
                                            <tr class="message-unread">
                                                <td class="hidden-xs">
                                                    <label class="option block mn">
                                                        <input type="checkbox" name="mobileos" value="FR">
                                                        <span class="checkbox mn"></span>
                                                    </label>
                                                </td>
                                                <td style="padding-left: 100px;">${cat3.title}</td>
                                                <td>${cat3.info}</td>
                                                <td>
                                                    <a href="/admin/Catalog/remove.do?id=${cat3.id}">删除</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
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