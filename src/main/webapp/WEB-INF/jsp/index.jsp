<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!----- Adding Background Colour -->
<div style="background-color:#A9A9A9;
    background-attachment: scroll;">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Todo List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/KanbanStyle.css">
    <script src="${pageContext.request.contextPath}/js/KanbanScript.js"></script>
</head>
<body>


<style type ="text/css">
    body
    {
        background-image: url("/image/ba.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        text-color: white;
        text-align: center;
    }
    .navbar{
        background-color:black;
        navbar:center;
        font-family: Helvetica, Arial, sans-serif;
        font-size:100%;
    }
    .topnav-centered{
        float: none;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>



<jsp:include page="/WEB-INF/jsp/nav-bar.jsp"/>
<div class="container-fluid">
    <div class="row mt-4">
        <div class="col-12">
            <h3 class="bg-primary text-white p-2">Todo Items</h3>
        </div>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col"><label>#</label></th>
            <th scope="col"><label>Title</label></th>
            <th scope="col"><label>Completed</label></th>
            <th scope="col"><label>Action</label></th>
            <th scope="col"><label>Option </label></th>
            <th scope="col"><label>Kandban Board </label></th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="todo" items="${todos}">
        <tr>
            <th scope="row">${todo.id}</th>
            <td>
                    ${todo.title}
            </td>
            <td>
                    ${todo.completed}
            </td>
            <td>
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/edit/${todo.id}">Edit</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/complete/${todo.id}">Complete</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/todo/delete/${todo.id}">Delete</a>
                </div>
            </td>
            <td>
                   ${todo.options}
            </td>
            <td>
                    ${todo.KB}
            </td>

        </tr>
        </c:forEach>
    </table>
</div>


<div id="p1" class="mdl-progress mdl-js-progress"></div>
<script>
    document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
        this.MaterialProgress.setProgress(44);
    });
</script>




    <ol class="kanban ready">
        <h3> Ready</h3>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">This is Ready</div><div class="actions"></div>
        </li>
    </ol>


    <ol class="kanban inprogress">
        <h3>In-Progress</h3>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">Title: System  Development</div><div class="actions"></div>

        </li>

    </ol>

    <ol class="kanban done">
        <h3> Done</h3>
        <li class="dd-item" data-id="5">
            <div class="text" contenteditable="true">This is Done</div><div class="actions"></div>
        </li>
    </ol>

</div>



</body>
</html>
</div>