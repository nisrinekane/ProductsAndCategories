<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/7/22
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>new product</title>
</head>
<body>
  <h1>new product</h1>
  <form:form action="/createProduct" method="POST" modelAttribute="product">
    <div class="form-group">
      <form:label path="name">Name</form:label>
      <form:input path="name" />
      <div>
        <form:errors path="name" class="text-danger"/>
      </div>
    </div>
    <div class="form-group">
      <form:label path="description">Description</form:label>
      <form:input type="textarea" path="description" />
      <div>
        <form:errors path="description" class="text-danger"/>
      </div>
    </div>
    <div class="form-group">
      <form:label path="price">Price</form:label>
      <form:input type="number" step="0.01" path="price" />
      <div>
        <form:errors path="price" class="text-danger"/>
      </div>
    </div>
    <input type="submit" value="Submit" class="btn btn-dark" />
  </form:form>
</body>
</html>
