<%--
  Created by IntelliJ IDEA.
  User: renming
  Date: 13-12-5
  Time: 上午9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
</head>
<style type="text/css">
    *{
        margin:0;
        padding:0;
        list-style:none;
    }
    .nav{
        height:30px;
        border-bottom:2px solid #4195e5;
    }
    .nav li{
        display:inline-block;
        height:30px;
        float:left;
        margin-right:3px;
    }
    .nav li a{
        display:inline-block;
        height:30px;
        font:bold 13px/30px "Microsoft YaHei";
        text-align:center;
        text-decoration:none;
        width:89px;
        background:url(/images/nav_bg.png) 0 0 no-repeat;
        color:#f0f0f0;
    }
    .nav li a.current{
        background:url(/images/nav_bg.png) 0 -30px no-repeat;
        color:#333;
    }
</style>
<body>
<ul class="nav">
    <li><a class="current" href="/kps/tools/qq_page" target="content">QQ在线</a></li>
    <li><a href="javascript:;" target="content">预约看房</a></li>
    <li><a href="http://www.qq.com" target="content">广告橱窗</a></li>
    <li><a href="http://www.sina.com" target="content">文字特效</a></li>
    <li><a href="http://www.sina.com" target="content">装修素材</a></li>
    <li><a href="http://www.sina.com" target="content">去水印</a></li>
    <li><a href="http://www.sina.com" target="content">加水印</a></li>
</ul>
</body>
</html>
