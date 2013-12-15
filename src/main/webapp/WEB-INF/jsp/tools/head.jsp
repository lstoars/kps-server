<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .nav {
        margin-top:1px;
        height: 30px;
        border-bottom: 2px solid #4195e5;
    }

    .nav li {
        display: inline-block;
        height: 30px;
        float: left;
        margin-right: 3px;
    }

    .nav li a {
        display: inline-block;
        height: 30px;
        font: bold 13px/30px "Microsoft YaHei";
        text-align: center;
        text-decoration: none;
        width: 89px;
        background: url(/images/nav_bg.png) 0 -30px no-repeat;
        color: #333;
    }

    .nav li a.current {
        background: url(/images/nav_bg.png) 0 0 no-repeat;

        color: #f0f0f0;
    }
</style>
<body>
<ul class="nav">
    <li><a class="current head_banner" href="/kps/tools/qq_page" hidefocus="true" target="content">QQ在线</a></li>
    <li><a class="head_banner" href="/kps//tools/title_images/1" hidefocus="true" target="content">标题图</a></li>
    <li><a class="head_banner" href="/kps/tools/bulletin_board" hidefocus="true" target="content">公告栏</a></li>
    <li><a class="head_banner" href="/kps/tools/image_material" hidefocus="true" target="content">图片素材</a></li>
    <li><a class="head_banner" href="/kps/tools/link_ads" hidefocus="true" target="content">链接广告</a></li>
    <li><a class="head_banner" href="/kps/tools/tel_query_page" hidefocus="true" target="content">同行鉴定</a></li>
    <%--<li><a class="head_banner" href="http://www.sina.com" target="content">去水印</a></li>--%>
    <%--<li><a class="head_banner" href="http://www.sina.com" target="content">加水印</a></li> --%>
    <%--<li><a <c:if test="${type=='sms'}"> class="current" </c:if> href="/kps/tools/sms_page" target="content">预约看房</a></li>--%>
    <%--<li><a <c:if test="${type=='ad_show'}"> class="current" </c:if> href="/kps/tools/ad_show" target="content">广告橱窗</a></li>--%>
</ul>
<script src="/scripts/common.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $(".head_banner").click(function () {
            $(".head_banner").removeClass("current");
            $(this).addClass("current")
        });
    })
</script>
</body>
</html>
