<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/7/22
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/styles.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<html>
<head>
  <title>show category</title>
</head>
<body>
<h1><c:out value="${category.name}" />'s Categories</h1>
<div class="card">
  <ul>
    <c:forEach var="categoryProd" items="${category.products}">
      <li>${categoryProd.name} <a href="/students/${category.id}/removeProduct/${categoryProd.id}">remove</a></li>
    </c:forEach>
  </ul>
  <form action="/updateCategory/${category.id}" method="POST">
    <select name="productId">
      <c:forEach var="product" items="${products}">
        <!--- Each option VALUE is the id of the person --->
        <option value="${product.id}">
          <!--- This is what shows to the user as the option --->
          <c:out value="${product.name}"/>
        </option>
      </c:forEach>
    </select>
    <input type="submit" value="Submit" class="btn btn-dark" />
  </form>
  <a href="/" class="btn btn-primary">Back To Dashboard</a>
</div>
</body>
</html>

