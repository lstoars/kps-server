<%--
  Created by IntelliJ IDEA.
  User: renming
  Date: 13-12-9
  Time: 下午1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<style type="text/css">
*{
    margin: 0;
    padding: 0;
    list-style: none;
}
body{
    height:100%;
    width:100%;
    border-right:1px solid #999;
    font-size: 12px;
}
.tc{
    text-align: center;
}
.pt5{
    padding-top: 5px;
}
.pb5{
    padding-bottom: 5px;
}
a:link,a:active,a:visited{
    font-size:12px;
    text-decoration:none;
    color:#333;
    outline:none;
}
a:hover{
    color:#bc283e;
}
ul li{
    line-height: 20px;
    padding-left: 8px;
}
</style>
<body>
  <p class="tc" style="margin-top: 3px"><img src="/images/erwei.png" /></p>
  <ul style="margin-top: 5px">
      <c:forEach items="${news}" var="new" varStatus="status">
          <li><a href="${new.url}" target="_blank">${new.title}</a></li>
      </c:forEach>
  </ul>
</body>
<script src="/scripts/common.js"></script>
</html>