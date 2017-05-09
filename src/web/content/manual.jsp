<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mengdacheng
  Date: 2017/5/3
  Time: 下午2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已选试题</title>
    <link rel="stylesheet" href="/content/css/bootstrap.min.css" type="text/css" />

    <script type="text/javascript" src="/content/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/content/js/bootstrap.min.js" ></script>
</head>
<body>
<!--导航区域开始-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">组卷系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index.html">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">参数设置</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        试题类型<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
                <li><a href="/manage.html">试题管理</a></li>
            </ul>
            <form class="navbar-form navbar-right">

                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<!--导航区域结束-->
<div class="container" style="margin-top: 50px">
<ul class="list-group" style="margin-top: 20px;">
    <c:forEach var="item" items="${selectList}">
        <li class="list-group-item">
            <span class="text-info">${item.id}.</span>
            <a class="btn badge" href="/remove.html?selectId=${item.id}">移除试题</a>
            <a class="btn badge" href="/adjust.html?selectId=${item.id}">修改试题</a>
                ${item.content}
        </li>
    </c:forEach>
</ul>
</div>
</body>
</html>
