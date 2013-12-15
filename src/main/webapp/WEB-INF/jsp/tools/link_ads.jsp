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

        #cp_div {
            display: none;
        }

        #link_input_div {
            display: none;
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
                        <td>店铺装修图片，双击复制</td>
                    </tr>
                    <c:forEach items="${images}" var="image">
                        <tr>
                            <td class="col1" style="padding-top: 10px">
                                <div ondblclick="clickCopy(this)">
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

<div id="cp_div">

</div>

<div id="link_input_div">
    <input type="text" name="image_url" id="image_url" value="" style="width: 350px">
</div>

<script type="text/javascript">
    function clickCopy(div) {
        var content = div.innerHTML;
        art.dialog({
            padding: '10px',
            esc: false,
            lock: true,
            width:'400px',
            title: "请输入图片链接地址",
            content: document.getElementById("link_input_div"),
            okVal: "复制",
            ok: function () {
                var path = $("#image_url").val();
                if($.trim(path) == '') {
                    alert("建议填入网店地址，无请填 #！");
                    return false;
                }
                var html = "";
                if(path=='#') {
                    html += "<a href='javascript:;' target='_blank'>";
                } else {
                    if(path.substring(0,7)=="") {
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
            }, cancelVal: '取消',cancel:true
        });
    }
</script>
<script type="text/javascript" src="http://i.jjshome.com/js/common/artDialog/artDialog.source.js?skin=green"
        charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="/scripts/common.js"></script>
</body>
</html>