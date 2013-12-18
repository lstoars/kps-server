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
    outline:none;
    color:#06c;
    text-decoration:none;
}
a:hover{
    color:#bc283e;
    text-decoration:underline;
}
ul li{
    line-height: 20px;
    padding:3px 0 3px 8px;
    border-bottom: 1px solid #f0f0f0;
}
</style>
<body>
  <p class="tc" style="margin-top: 3px"><img src="/images/erwei.png" /></p>
  <p class="tc pt5 pb5">微信号：fangrukou</p>
  <p style="border-bottom:2px #ccc solid;padding:3px 8px; color:green; line-height: 20px;" >
      房入口小助手每天都会分享业内最有用的营销技巧，如果你能坚持看一年，你的人生将会改变。快用微信，扫描二维码关注吧！<br/>
      今日分享：
  </p>
  <ul style="margin-top: 10px;padding:0 3px;height: 270px">
      <c:forEach items="${news}" var="new" varStatus="status">
          <li><a href="${new.url}" target="_blank">${new.title}</a></li>
      </c:forEach>
  </ul>
</body>
<script src="/scripts/common.js"></script>
</html>