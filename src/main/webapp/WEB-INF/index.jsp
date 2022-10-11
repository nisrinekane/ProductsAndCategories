<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/7/22
  Time: 3:30 PM
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
    <title>home</title>
</head>
<body>
    <div class="flexed">
        <div class="card">
            <h1>Products</h1>
            <ul>
              <c:forEach items="${products}" var="product">
                    <li>
                        <a href="/products/${product.id}"><c:out value="${product.name}" /></a>
                    </li>
              </c:forEach>

            </ul>

        </div>
        <div class="card">
            <h1> Categories</h1>
            <ul>
                <c:forEach items="${categories}" var="category">
                    <li>
                        <a href="/categories/${category.id}"><c:out value="${category.name}" /></a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <a href="/products/new" class="btn btn-primary"/>new product</a>
    <a href="/category/new" class="btn btn-primary"/>new category</a>
</body>
</html>
