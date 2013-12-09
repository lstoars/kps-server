<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
            width: 650px;
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


    </style>
</head>
<body>
<div class="page_wrap">
    <div class="content">
        <div class="section section1">
            <div class="section_middle">
                <table class="set_style_table" id="setTable">
                    <tbody>
                    <tr class="row1">
                        <td colspan="2">加入特效会有不一样的效果。</td>
                    </tr>
                    <tr class="row1">
                        <td colspan="2">
                            <b>文字：</b><input type="text" name="wordTipIpt" class="word_tip_ipt" id="textContent"
                                             stexttyle="width: 400px" value="">
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="预览"
                                   style="width: 50px;" onclick="preView()"/>
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="复制"
                                   style="width: 50px;" onclick="copyClick()"/>
                            <input type="text" name="wordTipIpt" class="word_tip_ipt" id="link" style="width:200px"
                                   value="文字链接地址，可不填" onfocus="if(value =='文字链接地址，可不填'){value =''}"
                                   onblur="if(value ==''){value='文字链接地址，可不填'}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height=10>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="col1" style="width: 130px">
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="1" prop="direction"
                                       direction="left" checked="checked">右进左出
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="2" prop="direction"
                                       direction="right">左进右出
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="3" prop="direction,behavior"
                                       direction="left" behavior="slide">右进只走一次
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="4"
                                       prop="direction,behavior" direction="right"
                                       behavior="slide">左进只走一次
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="5"
                                       prop="direction,behavior" direction="left"
                                       behavior="alternate">右进来回走
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="6"
                                       prop="direction,behavior" direction="right"
                                       behavior="alternate">左进来回走
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="7" prop="direction"
                                       direction="up">下进上出
                            </div>
                            <div style="margin-top: 5px">
                                <input type="radio" name="xg" value="8" prop="direction"
                                       direction="down">上进下出
                            </div>
                        </td>
                        <td class="col_ipt" style="border-style:dotted;width: 400px;text-align: center;height: 205"
                            id="yl_td">
                            预览区
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
<script type="text/javascript">
    function preView() {
        var contentValue = $("#textContent").val();
        if ($.trim(contentValue) == '') {
            alert("请输入要加入特效的文字！");
            return false;
        }

        var checkObj = $('input[name="xg"]:checked');
        var props = checkObj.attr("prop").split(",");
        var content = "<marquee ";
        for (var i = 0; i < props.length; i++) {
            content += props[i] + "='" + checkObj.attr(props[i]) + "'";
        }
        content += ">";
        var link = $("#link").val();
        if ($.trim(link) == '') {
            content += contentValue;
        } else {
            content += "<a target='_blank' href='" + link + "' >" + contentValue;
            +"</a>";
        }
        content += "</marquee>";
        $("#yl_td").html(content);
        $("#c_div").html(content);
    }

    function copyClick() {
        var contentValue = $("#textContent").val();
        if ($.trim(contentValue) == '') {
            alert("请输入要加入特效的文字！");
            return false;
        }
        var checkObj = $('input[name="xg"]:checked');
        var props = checkObj.attr("prop").split(",");
        var content = "<marquee ";
        for (var i = 0; i < props.length; i++) {
            content += props[i] + "='" + checkObj.attr(props[i]) + "'";
        }
        content += ">";
        var link = $("#link").val();
        if ($.trim(link) == '') {
            content += contentValue;
        } else {
            content += "<a target='_blank' href='" + link + "' >" + contentValue;
            +"</a>";
        }
        content += "</marquee>";
        $("#c_div").html(content);
        $("#cp_div").html(content);
        div = document.getElementById("cp_div");
        copyContent(div);
    }
</script>
<script src="/scripts/common.js"></script>
</body>
</html>