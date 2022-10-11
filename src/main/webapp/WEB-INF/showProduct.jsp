<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/7/22
  Time: 4:08 PM
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
    <title>show product</title>
</head>
<body>
<h1><c:out value="${product.name}" />'s Categories</h1>
<div class="card">
    <ul>
        <c:forEach var="productCat" items="${product.categories}">
            <li>${productCat.name}</li>
        </c:forEach>
    </ul>
    <form action="/updateProduct/${product.id}" method="POST">
        <select name="categoryId">
            <c:forEach var="category" items="${categories}">
                <!--- Each option VALUE is the id of the person --->
                <option value="${category.id}">
                    <!--- This is what shows to the user as the option --->
                    <c:out value="${category.name}"/>
                </option>
            </c:forEach>
        </select>
        <input type="submit" value="Submit" class="btn btn-dark" />
    </form>
    <a href="/" class="btn btn-primary">Back To Dashboard</a>
</div>
</body>
</html>
