<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/7/22
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>products and categories</title>
</head>
<body>
<h1>new category</h1>
<form:form action="/createCategory" method="POST" modelAttribute="category">
  <div class="form-group">
    <form:label path="name">Name</form:label>
    <form:input path="name" />
    <div>
      <form:errors path="name" class="text-danger"/>
    </div>
  </div>
  <input type="submit" value="Submit" class="btn btn-dark" />
</form:form>
</body>
</html>
