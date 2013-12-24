<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文字特效</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
            width: 750px;
            height: 250px;
            margin: 0px 0 0 0px;
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

        .c_div {
            display: none;
        }

        .copy_button {
            width: 50px;
            height: 30px;
            background: #ccc;
            border: 1px solid #b0afaf;
            color: #000;
        }

        .image_type {
            margin-left: 10px;
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
                    <tr class="row1">
                        <td colspan="3"><span style="color: red">①输入文字点击复制;②在房源描述里粘贴即可（快捷键Ctrl+V）</span><a href="http://www.fangrukou.com/make.htm" target="_blank" style="margin-left: 10px">不会用，点这看教程！</a></td>
                    </tr>
                    <tr>
                        <td style="padding-top: 15px">背景图片</td>
                        <td colspan="2" style="padding-top: 15px">
                            <label>
                                <input type="radio" name="back_type" checked="checked" class="image_type" w="650"
                                       h="239" t="135" l="60"
                                       value="1">背景图片1
                            </label>
                            <label>
                                <input type="radio" name="back_type" class="image_type" w="650" h="328"
                                       value="2">背景图片2
                            </label>
                            <label>
                                <input type="radio" name="back_type" class="image_type" w="650" h="328"
                                       value="3">背景图片3
                            </label>
                            <label>
                                <input type="radio" name="back_type" class="image_type" w="650" h="239"
                                       value="4">无背景图片
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="padding-top: 15px">效果</td>
                        <td colspan="2" style="padding-top: 15px">
                            <label>
                                <input type="radio" style="margin-left: 10px" name="xg" class="direction_type" value="up" checked="checked">由下自上
                            </label>

                            <label>
                                <input type="radio" name="xg" class="direction_type" value="right" >左进右出
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 15px">
                            <label>
                                <input type="radio" name="xg" style="margin-left: 10px" class="direction_type" value="down">由上自下
                            </label>

                            <label>
                                <input type="radio" name="xg" class="direction_type" value="left" >右进左出
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>字体</td>
                        <td colspan="2" style="padding-top: 15px">
                            <input type="text" id="font_size" class="word_tip_ipt" maxlength="3" value="16" style="width: 40px">建议范围（10-99）
                            颜色：<input type="text" class="color" id="color" style="width: 60px">
                        </td>
                    </tr>
                    <tr>
                        <td>文字</td>
                        <td style="padding-top: 15px">
                            <textarea rows="8" cols="50" id="textContent">如：感谢您的点击
本人从事房产代理行业8年
对八卦岭、园岭一带相当熟悉
如果您有租房买房需求联系我！
电话：18999999999</textarea>
                        </td>
                        <td valign="bottom" align="left">
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="预览"
                                   style="width: 50px;" onclick="preView()"/>
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="复制"
                                   style="width: 50px;" onclick="copyClick()"/>
                        </td>
                    </tr>
                    <tr id="type_1" class="preview_tr">
                        <td colspan="3" style="border-style:dotted;">
                            <span id="preview_div_1"
                                 style="display: block;width: 650px;height:239px;background: url(http://ww3.sinaimg.cn/mw690/ea81c460gw1eben9th69wj20i206ndg8.jpg);position:relative;">
                                <marquee id="marquee_1" scrollamount="3" width="325" height="200"
                                         direction="up"
                                         style="position:absolute; top:24px; left:175px;color:#BA1318;font-size: 20px">
                                    感谢您的点击<br/>
                                    本人从事房产代理行业8年<br/>
                                    对八卦岭、园岭一带相当熟悉<br/>
                                    如果您有租房买房需求联系我！<br/>
                                    电话：18999999999<br/>
                                </marquee>
                            </span>
                        </td>
                    </tr>
                    <tr id="type_2" style="display: none" class="preview_tr">
                        <td colspan="3" style="border-style:dotted;">
                            <span id="preview_div_2"
                                 style="display: block;width: 650px;height:328px;background: url(http://ww3.sinaimg.cn/mw690/ea81c460gw1eben9t1nxwj20i2094wfo.jpg);position:relative;">
                                <marquee id="marquee_2" direction="up" scrollamount="3" width="276" height="224"
                                         style="position:absolute; top:92px; left:250px;">
                                </marquee>
                            </span>
                        </td>
                    </tr>
                    <tr id="type_3" style="display: none" class="preview_tr">
                        <td colspan="3" style="border-style:dotted;">
                            <span id="preview_div_3"
                                 style="display: block;width: 650px;height:328px;background: url(http://ww4.sinaimg.cn/mw690/ea81c460gw1eben9sn9i8j20i2094jsa.jpg);position:relative;">
                                <marquee id="marquee_3" direction="up" scrollamount="3" width="412" height="225"
                                         style="position:absolute; top:62px; left:265px;"></marquee>
                            </span>
                        </td>
                    </tr>
                    <tr id="type_4" style="display: none" class="preview_tr">
                        <td colspan="3" style="border-style:dotted;">
                            <span id="preview_div_4" style="width: 650px;height:239px;">
                                <marquee id="marquee_4" direction="up" scrollamount="3" width="600" height="200"  style="margin-left: 10px"></marquee>
                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="c_div" id="cp_div" style="width: 700px">

</div>

<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="/scripts/jscolor/jscolor.js"></script>
<script src="/scripts/common.js"></script>
<script type="text/javascript">
    var myPicker = new jscolor.color(document.getElementById('color'), {})
    myPicker.fromString('4F4D4A')  // now you can access API via 'myPicker' variable

    $(function () {
        $(".image_type").click(function () {
            $(".preview_tr").css("display", "none");
            $("#type_" + $(this).val()).css("display", "");
        });
    });

    function preView() {
        var contentValue = $("#textContent").val();
        if ($.trim(contentValue) == '') {
            alert("请输入要加入特效的文字！");
            return false;
        }
        content = contentValue.replaceAll("\n", "<br/>");
        var fontSize = $("#font_size").val();
        var xgObj = $('input[name="xg"]:checked');
        var backTypeObj = $('input[name="back_type"]:checked');
        var color = $("#color").val();
        $("#marquee_"+backTypeObj.val()).css("font-size",fontSize+"px");
        $("#marquee_"+backTypeObj.val()).css("color","#"+color);
        $("#marquee_"+backTypeObj.val()).attr("direction",xgObj.val());
        $("#marquee_"+backTypeObj.val()).html(content);
        $(".preview_tr").css("display", "none");
        $("#type_" + backTypeObj.val()).css("display", "");
    }

    function copyClick() {
        preView();
        var type = $('input[name="back_type"]:checked').val();
        div = document.getElementById("preview_div_"+type);
        copyContent(div);
    }
</script>

</body>
</html>