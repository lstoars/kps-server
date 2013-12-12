<%--
  Created by IntelliJ IDEA.
  User: hcf
  Date: 13-12-12
  Time: 上午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
            width: 800px;
            height: 250px;
        }

        .section {
            position: relative
        }

        .set_style_table {
            font-size: 14px;
            color: #5c5c5c;
        }

        .set_style_table .row1 {
            height: 18px;
            line-height: 18px
        }

        .set_style_table .col {
            width: 102px
        }

        .set_style_table .col label {
            float: left;
            margin: 1px 0 0 0;
        }

        .set_style_table .col1 {
            width: 80px
        }

        .set_style_table .col_ipt {
            width: 20px
        }

        .set_style_table .ipt_radio {
            width: 13px;
            height: 13px
        }

        .set_style_table .row2 {
            vertical-align: top
        }

        .set_style_table .row2 td {
            height: 162px
        }

        .set_style_table .row2 td img {
            margin-top: 7px
        }

        .set_style_table .row2 {
            color: #5c5c5c;
            height: 28px;
            line-height: 28px
        }

        .set_style_table .row3 {
            text-align: left
        }

        .set_style_table .row3 td {
            padding-top: 25px
        }

        .word_tip_ipt {
            width: 160px;
            padding-left: 13px;
            padding-right: 13px;
            height: 26px;
            line-height: 26px;
            color: #a1a1a1
        }

        .word_tip_ipt:focus {
            border-color: #8ac5e5
        }

        .section2 .section_middle {
            margin: 19px 0 0 70px
        }

        .word_tip_ipt2 {
            width: 50px;
            height: 30px;
            background: #ccc;
            border: 1px solid #b0afaf;
        }

        .wraps {
            float: right;
        }

        .wraps span {
            float: left;
            margin-top: 5px;;
        }

        .wraps input {
            float: left;
        }

        .wraps .word_tip_ipt2 {
            margin-left: 5px;;
        }

        .list td {
            height: 30px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="page_wrap">
    <div class="content">
        <div class="section section1" style="margin-top: 10px;margin-left: 10px">
            <form class="section_middle" action="/kps/admin/save_news" method="post">
                <table class="set_style_table" id="setTable">
                    <tbody>
                    <tr>
                        <td>标题</td>
                        <td><input type="text" name="title" style="width: 300px;height: 30px"></td>
                    </tr>
                    <tr>
                        <td style="padding-top:5px;">URL</td>
                        <td style="padding-top:5px;"><input type="text" name="url" style="width: 300px;height: 30px">
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top:5px;" align="right">
                            <input type="submit" value="保存" class="word_tip_ipt2">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <form class="section section1" style="margin-top: 10px;margin-left: 10px" method="post" action="/kps/admin/set_news_index">
            <table width="100%" border="1" cellspacing="0" cellpadding="0" style="border:1px solid #8fc7f0;"
                   class="list">
                <tbody>
                <tr>
                    <th style="width: 30%">标题</th>
                    <th style="width: 30%">排序号</th>
                    <th style="width: 30%">操作</th>
                </tr>
                <c:forEach items="${news}" var="new" varStatus="status">
                    <tr>
                        <td><a href="${new.url}">${new.title}</a></td>
                        <td>
                            <input type="hidden" name="newsid" value="${new.id}">
                            <input type="text" name="sort_index_${new.id}" value="${new.sortIndex}">
                        </td>
                        <td align="center"><a href="/kps/admin/del_news?id=${new.id}">删除</a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" value="保存" class="word_tip_ipt2">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>