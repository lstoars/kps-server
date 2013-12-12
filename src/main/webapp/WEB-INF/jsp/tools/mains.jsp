<%--
  Created by IntelliJ IDEA.
  User: renming
  Date: 13-12-6
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房入口-工具箱</title>
    <jsp:include page="../baidu_tj.jsp"></jsp:include>
</head>

<frameset cols="180,720"  border="1"  scrolling="no" >
    <frame name="index" src="/kps/tools/left"  scrolling="no" noresize >
    <frameset rows="33,*" border="0"  frameborder="no" scrolling="no" noresize >
        <frame name="index" src="/kps/tools/head">
        <frame name="content" src="/kps/tools/qq_page">
    </frameset><noframes></noframes>
</frameset>

<script src="/scripts/common.js"></script>
</html>