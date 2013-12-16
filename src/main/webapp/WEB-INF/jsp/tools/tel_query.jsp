<%--
  Created by IntelliJ IDEA.
  User: fei
  Date: 13-12-14
  Time: 上午12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
            width: 453px;
            height: 250px;
            margin: 20px 0 0 30px;;
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

        #copy_div {
            display: none;
        }

        .cf60 {
            color: #f60;
        }

        .fb {
            font-weight: bold;
        }

        .result_text {
            border: 1px solid #ccc;
            padding: 20px;
        }
    </style>
    <jsp:include page="../baidu_tj.jsp"></jsp:include>
</head>
<body>
<div class="page_wrap">
    <div class="content">
        <div class="section section1">
            <div class="section_middle">
                <table class="set_style_table" id="setTable">
                    <tbody>
                    <tr>
                        <td>
                            手机号码：
                        </td>
                        <td>
                            <input type="text" name="tel" class="word_tip_ipt" id="tel" value=""
                                   maxlength="11">
                        </td>
                        <td>
                            <input type="button" name="copy" value="查询" class="word_tip_ipt2"
                                   onclick="telQuery()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-top:15px ">本工具目前总计收录<span class="fb cf60">61803</span>个同行电话号码
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;padding-top:10px; ">
                            <div id="r" class="result_text" style="width: 450px"></div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/scripts/common.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script>

    function telQuery() {
        $("#r").html("");
        /*if (!checkMobile($("#tel").val())) {
            $("#r").html("<span style='color: red'>您输入的电话格式有误！</span>");
            return;
        }*/
        if(!checkMobile($("#tel").val())){
            $("#r").html("<span style='color: red'>您输入的电话格式有误！</span>");
            return;
        }
        $.ajax({
            url: "/kps/tools/tel_query",
            type: "post",
            dataType: "json",
            async: false,
            data: {'tel': $("#tel").val()},
            success: function (msg) {
                if (msg.find) {
                    $("#r").html("<span style='color: red'>该手机有在库中记录，很有可能是同行，手机号码归属地:" + msg.location + "。</span>");
                } else {
                    $("#r").html("<span style='color: green'>该手机没有在库中记录，可能不是同行，手机号码归属地:" + msg.location + "。</span>");
                }
            }
        })
    }
</script>
</body>
</html>