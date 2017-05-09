<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mengdacheng
  Date: 2017/5/3
  Time: 上午11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <title>Title</title>
    <link rel="stylesheet" href="/content/css/bootstrap.min.css" type="text/css" />
    <style>
        .typeLabel{
            margin: 0 5px 0 5px;
            padding: 5px 15px 5px 15px;
            font-size: 90%;
            border-radius: 5px;
        }
        .label-select{
            color: white;
            background-color: #4cae4c;
            font-weight: 400;
        }
        .label-unSelect{
            color:#333;
        }
    </style>

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
                <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
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
            <div class="navbar-form navbar-right">
                <a class="btn btn-default" data-toggle="modal" data-target="#myModal">登陆</a>
                <a class="btn btn-default">注册</a>
            </div>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<div class="container">
    <a class="btn btn-primary">手动组卷</a>
    <a class="btn btn-warning" href="/auto.html">自动组卷</a>
    <a class="btn btn-success" href="/manual.html">已选试题&nbsp;<span style="color: red;" id="selectCount">${selectList.size()}</span></a>
    <div class="table-bordered container" style="margin-top: 10px">
        <div style="border-bottom: dashed 1px; height: 50px;line-height: 50px">
            <span>题型:</span>
            <a class="typeLabel label-select">全部</a>
            <a class="typeLabel label-unSelect">单选题</a>
            <a class="typeLabel label-unSelect">多选题</a>
            <a class="typeLabel label-unSelect">填空题</a>
            <a class="typeLabel label-unSelect">语言表达</a>
            <a class="typeLabel label-unSelect">问答题</a>
            <a class="typeLabel label-unSelect">翻译题</a>
            <a class="typeLabel label-unSelect">阅读题</a>
        </div>
        <div style="border-bottom: dashed 1px; height: 50px;line-height: 50px">
            <span>难易:</span>
            <a class="typeLabel label-select">全部</a>
            <a class="typeLabel label-unSelect">容易</a>
            <a class="typeLabel label-unSelect">普通</a>
            <a class="typeLabel label-unSelect">困难</a>
        </div>
        <div style="height: 50px;line-height: 50px">
            <span>题类:</span>
            <a class="typeLabel label-select">全部</a>
            <a class="typeLabel label-unSelect">中考题</a>
            <a class="typeLabel label-unSelect">模拟题</a>
            <a class="typeLabel label-unSelect">常考题</a>
        </div>
    </div>

    <div style="margin-top: 10px">
        排序:<a class="typeLabel" style="color: green">时间<span class="glyphicon glyphicon-arrow-down"></span></a>
        <a class="typeLabel label-unSelect">组卷次数<span class="glyphicon glyphicon-arrow-up"></span></a>
    </div>

    <ul class="list-group" style="margin-top: 20px;" id="questionList">
        <c:forEach var="item" items="${questionList}">
            <li class="list-group-item">
                <pre><span class="text-info">${item.id}.</span>${item.content}</pre>
                <button class="btn badge" style="background-color: #eea236" value="${item.id}" onclick="select(this)">选择试题</button>
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
                    <c:if test="${item == pageId}"><li class="active"><a href="/index.html?pageId=${item+1}">${item+1}</a></li></c:if>
                    <c:if test="${item != pageId}"><li><a href="/index.html?pageId=${item+1}">${item+1}</a></li></c:if>
                </c:if>
                <c:if test="${item >= (total/20) - 1}"><li><a href="/index.html?pageId=${item+1}">${item+1}</a></li></c:if>
            </c:forEach>

            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form class="modal-content" method="post" action="<c:url value="/login.html" />">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">登陆</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="用户名"/>
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码"/>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">登陆</button>
            </div>
        </form>
    </div>
</div>
<script>
    function select(item) {
        var args = {};
        if(item.innerText == '选择试题'){
            item.parentNode.classList.add('disabled');
            item.innerText = '取消选择';
            args = {"selectId": item.value, "method": "add"};
        }else{
            item.parentNode.classList.remove('disabled');
            item.innerText = '选择试题';
            args = {"selectId": item.value, "method": "remove"};
        }
        $.post("/select.html", args, function(data){
            $('#selectCount').text(data.selectCount);
        }, "JSON");
    }
</script>
</body>
</html>
