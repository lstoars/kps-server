<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        .page_wrap {
            width:453px;
            height:250px;
            margin: 10px 0 0 10px;;
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
        .set_style_table .col label{
            float: left;
            margin:1px 0 0 0;
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

        .word_tip_ipt:focus{
            border-color: #8ac5e5
        }

        .section2 .section_middle {
            margin: 19px 0 0 70px
        }
        .word_tip_ipt2{
            width:50px;
            height: 30px;
            background: #ccc;
            border: 1px solid #b0afaf;
        }
        .wraps{
            float: right;
        }
        .wraps span{
            float: left;
            margin-top:5px;;
        }
        .wraps input{
            float: left;
        }
        .wraps .word_tip_ipt2{
            margin-left: 5px;;
        }

        #copy_div{
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
                        <td class="col1">组件样式：</td>
                        <td class="col_ipt">
                                <span>
                                    <input type="radio" class="ipt_radio" name="pictype" id="logo52" value="52">
                                </span>
                        </td>
                        <td class="col"><label for="logo52">简洁型</label></td>
                        <td class="col_ipt">
                                <span>
                                    <input type="radio" class="ipt_radio" name="pictype" id="logo51" value="51"
                                           checked="checked">
                                </span>
                        </td>
                        <td class="col"><label for="logo51">标准型</label></td>
                        <td class="col_ipt">
                                <span>
                                    <input type="radio" class="ipt_radio" name="pictype" id="logo53" value="53">
                                </span>
                        </td>
                        <td><label for="logo53">拓展型</label></td>
                    </tr>
                    <tr class="row2">
                        <td colspan="2"></td>
                        <td>
                            <img src="http://pub.idqqimg.com/wpa/images/counseling_style_51.png" title="点击这里给我发消息"
                                 class="logo_img">
                        </td>
                        <td></td>
                        <td>
                            <img src="http://pub.idqqimg.com/wpa/images/counseling_style_52.png" title="点击这里给我发消息"
                                 class="logo_img">
                        </td>
                        <td></td>
                        <td>
                            <img src="http://pub.idqqimg.com/wpa/images/counseling_style_53.png" title="点击这里给我发消息"
                                 class="logo_img">
                        </td>
                    </tr>
                    <tr class="row3">
                        <td colspan="7" style="text-align: right">
                            <span class="wraps">
                                <span class="text"> QQ号码： </span>
                                <input type="text" name="wordTipIpt" class="word_tip_ipt" id="wordTipIpt" value=""
                                            maxlength="30">
                                <input type="button" name="copy" value="复制" class="word_tip_ipt2" onclick="buttonClick()"/>
                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div id="copy_content_div" style="display:none">
    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=qq_code_num&site=qq&menu=yes">
        <img border="0" src="http://wpa.qq.com/pa?p=2:qq_code_num:style_type" alt="点击这里给我发消息" title="点击这里给我发消息"/>
    </a>
</div>

<div id="copy_div">

</div>

<script language="javascript">
    function buttonClick() {
        var content = document.getElementById("copy_content_div").innerHTML;
        var code = document.getElementById("wordTipIpt").value;
        var pictypes = document.getElementsByName("pictype");
        var picValue = 52;
        for(var i=0;i<pictypes.length;i++) {
            if(pictypes[i].checked == true) {
                picValue = pictypes[i].value;
            }
        }

        content = content.replaceAll("qq_code_num",code);
        content = content.replace("style_type",picValue);
        document.getElementById("copy_div").innerHTML=content;

        div = document.getElementById("copy_div");
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

    /**
     * 替换字符
     */
    String.prototype.replaceAll = function(s1, s2) {
        return this.replace(new RegExp(s1, "gm"), s2);
    };

</script>
</body>
</html>