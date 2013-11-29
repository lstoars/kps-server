<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>房源工具箱-预约看房</title>
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
                        <td colspan="3">
                            输入您的联系电话，点击“给我来电”按钮后， <br/>
                            ${phone}的手机会在2分钟内回拨您。
                            <input type="hidden" name="phone" value="${phone}" id="phone">
                            <input type="hidden" name="title" value="${title}" id="title">
                            <input type="hidden" name="refer" value="${refer}" id="refer">
                        </td>
                    </tr>
                    <tr class="row1">
                        <td colspan="1" style="text-align: right">
                            联系电话:
                        </td>
                        <td colspan="2">
                            <input type="text" name="cus_phone" class="word_tip_ipt" id="cus_phone" value=""
                                   maxlength="30">
                        </td>
                    </tr>
                    <tr class="row1">
                        <td colspan="1" style="text-align: right">
                            验证码:
                        </td>
                        <td colspan="1">
                            <input type="text" name="authCode" class="word_tip_ipt" id="authCode" value=""
                                   maxlength="30" style="width: 60px">
                        </td>
                        <td>
                            <img src="/kps/sms/verfiyImg" alt="验证码图片">
                        </td>
                    </tr>

                    <tr class="row1">
                        <td colspan="2">
                            &nbsp;
                        </td>
                        <td>
                            <input type="button" name="copy" class=" word_tip_ipt" value="给我来电"
                                   style="width: 120px;" onclick="send_sms()"/>
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
    function send_sms() {
        var phone = $("#phone").val();
        var title = $("#title").val();
        var refer = $("#refer").val();
        var cus_phone = $("#cus_phone").val();
        if ($.trim(cus_phone) == '') {
            alert("请输入您的手机号码！")
            $("#cus_phone").focus();
            return false;
        }

        if (!checkMobile(cus_phone)) {
            alert("手机号码格式不正确！")
            $("#cus_phone").focus();
            return false;
        }

        var authCode = $("#authCode").val();
        $.ajax({
            url: "/kps/sms/send",
            type: "post",
            dataType: "json",
            async: false,
            data: {'phone': phone, 'title': title, 'refer': refer, 'customerPhone': cus_phone, 'authCode': authCode},
            success: function (msg) {
                if (msg.success) {
                    alert("发送成功！");
                    window.close();
                } else {
                    alert(msg.message);
                }
            }
        })
    }

    function checkMobile(mobile) {
        var reg0 = /^13\d{9}$/;  // 130--139。至少7位
        var reg1 = /^15\d{9}$/;  // 联通150-159。至少7位
        var reg2 = /^18\d{9}$/;  // 移动180-189。至少7位
        var reg3 = /^14\d{9}$/;  // 移动140-149。至少7位
        var reg4 = /^00852\d{5,15}$/;  //香港的手机号码
        var reg5 = /^00853\d{5,15}$/; //澳门的手机号码
        var reg6 = /^00886\d{5,15}$/; //台湾的手机号码
        var my = false;
        if (reg0.test(mobile))my = true;
        if (reg1.test(mobile))my = true;
        if (reg2.test(mobile))my = true;
        if (reg3.test(mobile))my = true;
        if (reg4.test(mobile))my = true;
        if (reg5.test(mobile))my = true;
        if (reg6.test(mobile))my = true;
        return my;
    }
</script>
</body>
</html>