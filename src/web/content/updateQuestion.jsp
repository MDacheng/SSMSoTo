<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mengdacheng
  Date: 2017/5/3
  Time: 下午2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改试题</title>
    <link rel="stylesheet" href="/content/css/bootstrap.min.css" type="text/css" />

    <script type="text/javascript" src="/content/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/content/js/bootstrap.min.js" ></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
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
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<div class="container" style="margin-top: 100px">
    <form action="<c:url value="/updateQuestion.html"/>" method="post">
        <div class="row">
            <div class="col-md-9">
                <div class="form-group">
                    <label for="question">Question</label>
                    <textarea class="form-control" rows="9" id="question" name="content" placeholder="Question">${curQuestion.content}</textarea>
                </div>
                <div class="form-group">
                    <label for="knowledge">Knowledge</label>
                    <input type="password" class="form-control" name="knowledge" id="knowledge" placeholder="Knowledge" value="${curQuestion.knowledge}">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label for="type">Type</label>
                    <select class="form-control" id="type" name="type">
                        <option>Choice</option>
                        <option>Essay</option>
                        <option>Program</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="answer">Answer</label>
                    <select class="form-control" name="answer">
                        <option>A</option>
                        <option>B</option>
                        <option>C</option>
                        <option>D</option>
                    </select>
                    <textarea class="form-control hidden" rows="3" id="answer" placeholder="Answer"></textarea>
                </div>

                <div class="form-group">
                    <label for="difficulty" name="difficulty">Difficulty</label>
                    <input type="number" class="form-control" id="difficulty" min="0" max="1" step="0.1" value="0">
                    <%--<input type="password" class="form-control" id="difficulty" placeholder="Difficulty">--%>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</div>
</body>
</html>
