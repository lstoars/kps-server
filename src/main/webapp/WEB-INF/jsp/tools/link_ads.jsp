<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        a,img{border:0;}
        body{font:12px/180% Arial, Helvetica, sans-serif;}
        .jscolorstyle h3{font-size:14px;margin:20px;}
        .jscolorstyle p{padding:0 0 0 40px;margin:10px 0;}
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
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

        .cp_div {
            display: none;
        }

        #link_input_div {
            display: none;
        }

        .split_line {
            height:1px;
            width:100%;
            background:#00CCFF;
            overflow:hidden;
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
                        <td>文字链接，生成带链接的文字</td>
                    </tr>
                    <tr>
                        <td colspan="1" style="padding-top:5px ">
                            文字：<input type="text" name="text_c" class="word_tip_ipt" style="width: 330px" id="text_c"
                                      value="">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:5px ">
                            字体：<input type="text" id="font_size" class="word_tip_ipt" maxlength="3" value="16" style="width: 40px">建议范围（10-99）
                            颜色：<input type="text" class="color {pickerClosable:true}" id="color" style="width: 60px">
                            <label><input type="checkbox" name="open_new" id="open_new" value="1" checked>新窗口</label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:5px ">
                            链接：<input type="text" name="link" class="word_tip_ipt" style="width: 330px" id="link"
                                      value="">
                            <input type="button" name="preview" value="预览" class="word_tip_ipt2" onclick="preView()"
                                   style="margin-left: 5px"/>
                            <input type="button" name="copy" value="复制" class="word_tip_ipt2" onclick="copyLink()"
                                   style="margin-left: 5px"/>
                        </td>
                    </tr>
                    <tr>
                        <td id="preview_td" style="padding-top: 10px" nowrap="nowrap"></td>
                    </tr>
                    <tr><td ><div class="split_line"></div></td></tr>
                    <tr>
                        <td  style="padding-top:5px ">店铺图片链接，双击图片、输入链接地址</td>
                    </tr>
                    <c:forEach items="${images}" var="image">
                        <tr>
                            <td class="col1" style="padding-top: 10px" title="双击复制图片">
                                <div ondblclick="clickCopy(this)">
                                    <img src="${image.path}" alt="" image_id="${image.id}" >
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

<div id="cp_div">

</div>

<div id="link_input_div">
    <input type="text" name="image_url" id="image_url" value="" style="width: 350px">
</div>

<span id="abc_span" class="cp_div">

</span>
<script type="text/javascript" src="http://i.jjshome.com/js/common/artDialog/artDialog.source.js?skin=green"
        charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="/scripts/common.js"></script>
<script src="/scripts/jscolor/jscolor.js"></script>
<script type="text/javascript">

    var myPicker = new jscolor.color(document.getElementById('color'), {})
    myPicker.fromString('4F4D4A')  // now you can access API via 'myPicker' variable

    function preView() {
        $("#preview_td").html(getCopyLinkHtml());
    }

    function copyLink(){
        $("#abc_span").html(getCopyLinkHtml());
        copyContent2(document.getElementById("abc_span"));
    }

    function getCopyLinkHtml() {
        var text = $("#text_c").val();
        var link = $("#link").val();
        var fontSize = $("#font_size").val();
        var openNew = $("#open_new").attr("checked");
        var color = $("#color").val();
        var html = ""
        if (link.substring(0, 7) == "http://") {
            html += "<a href='" + link + "' style='color:#"+color+"'";
        } else {
            html += "<a href='http://" + link + "' style='color:#"+color+"'";
        }
        if(openNew == "checked") {
            html += " target='_blank'>";
        } else {
            html += ">";
        }
        html+="<span style='font-size: "+fontSize+"px;'>"+text+"</span><a>";
        return html;
    }

    function clickCopy(div) {
        var content = div.innerHTML;
        art.dialog({
            padding: '10px',
            esc: false,
            lock: true,
            width: '400px',
            title: "请输入图片链接地址",
            content: document.getElementById("link_input_div"),
            okVal: "复制",
            ok: function () {
                var path = $("#image_url").val();
                if ($.trim(path) == '') {
                    alert("建议填入网店地址，无请填 #！");
                    return false;
                }
                var html = "";
                if (path == '#') {
                    html += "<a href='javascript:;' target='_blank'>";
                } else {
                    if (path.substring(0, 7) == "http://") {
                        html += "<a href='" + path + "' target='_blank'>"
                    } else {
                        html += "<a href='http://" + path + "' target='_blank'>"
                    }
                }
                html += content;
                html += "</a>";
                $("#cp_div").html(html);
                var div = document.getElementById("cp_div");
                copyContent2(div);
            }, cancelVal: '取消', cancel: true
        });
    }
</script>
</body>
</html>