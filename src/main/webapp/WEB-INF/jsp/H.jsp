<%--
  Created by IntelliJ IDEA.
  User: labsadmin
  Date: 2020/04/17
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>  AkhonaMngqibisa </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/KanbanStyle.css">
    <script src="${pageContext.request.contextPath}/js/KanbanScript.js"></script>
</head>
<body>
<div id="p1" class="mdl-progress mdl-js-progress"></div>
<script>
    document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
        this.MaterialProgress.setProgress(44);
    });
</script>
<div class="kanban__title">
    <h1><center> To do list </center></h1>
</div>
<div class="dd">



    <ol class="kanban ready">
        <h2> Ready</h2>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">This is Ready</div><div class="actions"></div>
        </li>
    </ol>


    <ol class="kanban inprogress">
        <h2>In progress</h2>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">Title: System  Development</div><div class="actions"></div>

        </li>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">Description: This book is about the basics of programing</div><div class="actions"></div>

        </li>
    </ol>

    <ol class="kanban done">
        <h2> Done</h2>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">This is Done</div><div class="actions"></div>
        </li>
    </ol>

</div>

</div>
</div>


</body>
</html>
