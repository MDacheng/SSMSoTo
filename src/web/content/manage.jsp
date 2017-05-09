<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mengdacheng
  Date: 2017/5/4
  Time: 上午9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>试题管理</title>

    <link rel="stylesheet" href="/content/css/bootstrap.min.css" type="text/css" />

    <script type="text/javascript" src="/content/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/content/js/bootstrap.min.js" ></script>
</head>
<body style="padding-top: 70px;">
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
                <li><a href="/index.html">首页 <span class="sr-only">(current)</span></a></li>
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
                <li class="active"><a href="/manage.html">试题管理</a></li>
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
<div class="container">
    <a class="btn btn-success" href="/add.html">添加试题
        <span class="glyphicon glyphicon-plus-sign"></span></a>
    <ul class="list-group" style="margin-top: 20px;" id="questionList">
        <c:forEach var="item" items="${m_questionList}">
            <li class="list-group-item">
                <pre><span class="text-info">${item.id}.</span>&nbsp;${item.content}</pre>
                <div class="pull-right">
                    <a class="btn badge" style="background-color: #337ab7" href="/modify.html?questionId=${item.id}">修改</a>
                    <a class="btn badge" style="background-color: #d43f3a" href="/delete.html?questionId=${item.id}">删除</a>
                </div>
                <br>
            </li>
        </c:forEach>

    </ul>
</div>
<div class="container">
    <nav aria-label="Page navigation" class="center-block" style="width: 350px;">
        <ul class="pagination" id="turnPage">
            <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>

            <c:forEach var="item" begin="0" end="${total / 20}">
                <c:if test="${item == 6}"><li><a href="/index.html?pageId=${item+1}">...</a></li></c:if>
                <c:if test="${item < 6}">
                    <c:if test="${item == pageId}"><li class="active"><a href="/manage.html?pageId=${item+1}">${item+1}</a></li></c:if>
                    <c:if test="${item != pageId}"><li><a href="/manage.html?pageId=${item+1}">${item+1}</a></li></c:if>
                </c:if>
                <c:if test="${item >= (total/20) - 1}"><li><a href="/manage.html?pageId=${item+1}">${item+1}</a></li></c:if>
            </c:forEach>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>
