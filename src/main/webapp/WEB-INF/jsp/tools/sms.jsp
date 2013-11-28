<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            margin: 30px 0 0 72px
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
            width: 160px;
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

        #CssGaga {
            content: "131010171502,peu,290"
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
                            <img src="http://pub.idqqimg.com/wpa/images/counseling_style_52.png" title="点击这里给我发消息"
                                 class="logo_img">
                        </td>
                    </tr>
                    <tr class="row3">
                        <td colspan="6" style="text-align: right;height: 50px">
                            手机号码：<input type="text" name="wordTipIpt" class="word_tip_ipt" id="wordTipIpt" value=""
                                        maxlength="30">
                        </td>
                        <td>
                            <input type="button" name="copy" class="copy_button word_tip_ipt" value="复制"
                                   style="width: 80px;" onclick="copyClick()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            我们会将客户的预约信息通过短信方式发送到您的手机号上。您可即刻给用户回电。我们给您发的短信，典型运营商是收
                            我们的钱的，所以该插件是工具箱唯一收费插件。前300个客户，免收10月月功能费，短信费按1
                            毛\条（成本价）计算。您的每一个客户电话，您只需要付费1毛钱。名额有限，赶紧开通。
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
    function copyClick() {
        var mobile = $("#wordTipIpt").val();
        if ($.trim(mobile) == '') {
            $("#wordTipIpt").attr("placeholder", "请输入您的手机号码");
            $("#wordTipIpt").focus();
            return;
        }

        $.ajax({
            url: "/kps/tools/get_sms_count",
            type: "post",
            dataType: "json",
            async: false,
            data: {'mobile': mobile},
            success: function (msg) {
                if (msg.count == 0) {
                    window.location.href = "/kps/tools/sms_renew?phone=" + mobile;
                } else {
                    copyContent();
                }
            }
        })
    }

    function copyContent() {

    }
</script>
</body>
</html>