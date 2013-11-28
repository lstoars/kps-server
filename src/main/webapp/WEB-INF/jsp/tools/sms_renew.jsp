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
                            ${phone}的可用短信为0
                            <input type="hidden" name="phone" value="${phone}" id="phone">
                        </td>
                    </tr>
                    <tr class="row1">
                        <td colspan="3"></td>
                    </tr>
                    <tr class="row1">
                        <td style="width: 8%"></td>
                        <td>输入充值卡密码：
                            <input type="text" name="code" class="word_tip_ipt" id="code" value="" maxlength="12">
                        </td>
                        <td>
                            <input type="button" name="copy" value="充值" class="word_tip_ipt" style="width: 80px;"
                                   onclick="renew()"/>
                        </td>
                    </tr>
                    <tr class="row1">
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td style="width: 8%"></td>
                        <td colspan="2">
                            <a href="＃">购买卡密</a>
                        </td>
                    </tr>
                    <tr class="row1">
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            2014年1月1日前，免收每月10元的服务费，每条短信按成本价1毛/条收取！
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
    function renew() {
        $.ajax({
            url: "/kps/cc/auth",
            type: "post",
            dataType: "json",
            async: false,
            data: {'code': $("#code").val(), 'uname': $("#phone").val(), 'clientId': 'tools'},
            success: function (msg) {
                if (msg.success) {
                    alert("续费成功！");
                } else {
                    alert(msg.errorMsg);
                }
            }
        })
    }
</script>
</body>
</html>