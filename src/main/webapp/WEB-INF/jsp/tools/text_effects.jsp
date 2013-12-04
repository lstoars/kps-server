<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文字特效</title>
    <style type="text/css">
        .page_wrap {
            width: 600px;
            height: 400px;
        }

        .section {
            position: relative
        }

        .section1 {
            border-bottom: 1px solid #dedede
        }

        .section1 .section_middle {
            margin: 5px 0 0 72px
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

        .set_style_table .col1 {
            width: 100px
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
            height: 62px
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
            width: 340px;
            padding-left: 13px;
            padding-right: 13px;
            height: 26px;
            line-height: 26px;
            border: 1px solid #cdd2d7;
            border-radius: 3px;
            -moz-border-radius: 3px;
            color: #a1a1a1
        }

        .word_tip_ipt:focus, {
            border-color: #8ac5e5
        }

        .section2 .section_middle {
            margin: 19px 0 0 70px
        }

        .c_div {
            display: none;
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
                    <tr>
                        <td colspan="2" height="10"></td>
                    </tr>
                    <tr>
                        <td class="col1" style="width: 120px">
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
                        <td class="col_ipt" style="border-style:dotted;width: 400px;text-align: center;height: 205" id="yl_td">
                            预览区
                        </td>
                    </tr>
                    <tr class="row3">
                        <td colspan="2">
                            文字：<input type="text" name="wordTipIpt" class="word_tip_ipt" id="textContent"
                                      stexttyle="width: 400px" value="">
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="预览"
                                   style="width: 50px;" onclick="preView()"/>
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="复制"
                                   style="width: 50px;" onclick="copyClick()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" name="wordTipIpt" class="word_tip_ipt" id="link" style="width: 340px"
                                   value="滚动文字的链接地址，如没有可不填" >
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
        if($.trim(contentValue) =='') {
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
        if($.trim(contentValue) =='') {
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
        copyContent();
    }

    function copyContent() {
        div = document.getElementById("cp_div");
        div.contentEditable = 'true';
        var controlRange;
        if (document.body.createControlRange) {
            controlRange = document.body.createControlRange();
            controlRange.addElement(div);
            controlRange.execCommand('Copy');
        }
        div.contentEditable = 'false';
    }
</script>
</body>
</html>