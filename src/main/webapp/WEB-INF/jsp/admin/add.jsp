<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生成卡密</title>
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
                <form action="/kps/admin/add" method="post">
                <table class="set_style_table" id="setTable">
                    <tbody>
                    <tr class="row1">
                        <td style="width: 20%">生成张数：</td>
                        <td class="col_ipt">
                            <nobr>
                                <input type="text" class="word_tip_ipt" style="width: 100px" name="count" >
                            </nobr>
                        </td>
                        <td style="width: 20%">销售渠道：</td>
                        <td class="col_ipt">
                            <nobr>
                                <select name="saleChannel" class="word_tip_ipt"  style="width: 70px">
                                    <option value="taobao">淘宝</option>
                                    <option value="card">实体卡</option>
                                </select>
                            </nobr>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height:10px"></td>
                    </tr>
                    <tr class="row1" style="margin-top: 10px">
                        <td style="width: 20%">使用天数：</td>
                        <td class="col_ipt">
                            <nobr>
                                <input type="text" class="word_tip_ipt" style="width: 100px" name="term" >
                            </nobr>
                        </td>
                        <td style="width: 20%">短信条数：</td>
                        <td class="col_ipt">
                            <nobr>
                                <input type="text" class="word_tip_ipt" style="width: 100px" name="smsCount" >
                            </nobr>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <input type="submit" name="add" value="生成" class="word_tip_ipt" style="width: 80px">
                        </td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>