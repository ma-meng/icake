<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Custom Theme files -->
    <link href="/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- js -->
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-3.1.1.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="/js/simpleCart.min.js"> </script>
    <!-- cart -->
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 class="navbar-brand"><a  href="index.do">IMOOC</a></h1>
            </div>
            <!--navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="/index.do" class="active">首页</a></li>
                    <c:forEach items="${root.children}" var="cat1">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${cat1.title}<b class="caret"></b></a>
                            <ul class="dropdown-menu multi-column columns-4">
                                <div class="row">
                                    <c:forEach items="${cat1.children}" var="cat2">
                                        <div class="col-sm-3">
                                            <h4>西式</h4>
                                            <ul class="multi-column-dropdown">
                                                <c:forEach items="${cat2.children}" var="cat3">
                                                    <li><a class="list" href="/list.do?cid=${cat3.id}">${cat3.title}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                </div>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        <div class="header-info">
            <div class="header-right search-box">
                <a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
                <div class="search">
                    <form class="navbar-form">
                        <input type="text" class="form-control">
                        <button type="submit" class="btn btn-default" aria-label="Left Align">
                            搜
                        </button>
                    </form>
                </div>
            </div>
            <div class="header-right login">
                <a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <div id="loginBox">
                    <form id="loginForm">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">Email</label>
                                <input type="text" name="email" id="email">
                            </fieldset>
                            <fieldset>
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password">
                            </fieldset>
                            <input type="submit" id="login" value="登录">
                            <label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住</i></label>
                        </fieldset>
                        <p>新用户 ? <a class="sign" href="#">注册</a><span><a href="#">忘记密码?</a></span></p>
                    </form>
                </div>
            </div>
            <div class="header-right cart">
                <a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
                <div class="cart-box">
                    <h4><a href="#">
                        <span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>)
                    </a></h4>
                    <p><a href="#" class="simpleCart_empty">空</a></p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--//header-->
