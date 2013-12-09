<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
            margin:5px 0 0 3px;
            width: 700px;
            height: 250px;
        }

        .section {
            position: relative
        }

        .set_style_table {
            font-size: 14px;
            color: #5c5c5c
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
        .btns{
            border-bottom: 1px solid #ccc;;
        }
        .btns a:link,.btns a:active,.btns a:visited,.btns a:hover{
            display:inline-block;
            height: 24px;
            border:1px solid #ccc ;
            border-bottom: none;
            color: #333;
            font:normal 12px/24px "SinSun";
            text-decoration: none;
            padding: 0 8px;
            float: left;
            margin-right: 5px;;
        }
        .btns a.current{
           background: #ccc;
            color: #000;
        }
        .cred{
            color:#f00;
        }
    </style>
</head>
<body>
<div class="page_wrap">
    <div class="content">
        <div class="section section1">
            <div class="section_middle">
                <table class="set_style_table" id="setTable">
                    <tbody>
                    <tr>
                        <td >店铺装修图片，<span class="cred"> 双击您需要的图片复制</span></td>
                    </tr>
                    <tr style="margin-top: 5px">
                        <td class="btns">
                            <a class="current" href="/kps/tools/zx_images/1">主题1</a>
                            <a href="/kps/tools/zx_images/2">主题2</a>
                            <a href="/kps/tools/zx_images/3">主题3</a>
                            <a href="/kps/tools/zx_images/4">主题4</a>
                            <a href="/kps/tools/zx_images/5">主题5</a>
                        </td>
                    </tr>
                    <c:forEach items="${images}" var="image">
                        <tr>
                            <td class="col1">
                                <div ondblclick="buttonClick(this)">
                                    <img src="${image.path}" alt="" image_id=${image.id}>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script language="javascript">
    function buttonClick(div) {
        div.contentEditable = 'true';
        var controlRange;
        if (document.body.createControlRange) {
            controlRange = document.body.createControlRange();
            controlRange.addElement(div);
            controlRange.execCommand('Copy');
        }
        div.contentEditable = 'false';
        alert("复制成功。")
    }
</script>
</body>
</html>