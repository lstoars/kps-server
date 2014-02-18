<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .page_wrap {
            width: 550px;
            height: 250px;
            margin: 20px 0 0 30px;
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
            margin-top: 5px;
        }

        .wraps input {
            float: left;
        }

        .wraps .word_tip_ipt2 {
            margin-left: 5px;
        }

        #copy_div {
            display: none;
        }

        .cf60 {
            color: #f60;
        }

        .fb {
            font-weight: bold;
        }

        .result_text {
            border: 1px solid #ccc;
            padding: 20px;
        }

        .fl {
            float: left;
        }

        .mt4 {
            margin-top: 4px;
        }

        .ml4 {
            margin-left: 4px;
        }

        .loading {
            display: block;
            width: 32px;
            height: 32px;
            background: none;
        }

        .show {
            background: url("/images/loading_min.gif") 0 0 no-repeat;
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
                        <td colspan="4"><h2>支持视频来源</h2>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:20px">
                            <img src="../../../images/56.jpg" width="140" height="50">
                        </td>
                        <td style="padding-top:20px">
                            <div style="margin-top: 5px"><a href="http://mobile.56.com/video" target="_blank">手机客户端</a></div>
                            <div style="margin-top: 5px"><a href="http://upload.56.com/v/" target="_blank">我要上传</a></div>
                        </td>
                        <td style="padding-left: 20px;padding-top:20px">
                            <img src="../../../images/yklogo.png"  width="140" height="50">
                        </td>
                        <td style="padding-left: 20px;padding-top:20px;">
                            <div style="margin-top: 5px"><a href="http://mobile.youku.com/index/paike" target="_blank">手机客户端</a></div>
                            <div style="margin-top: 5px"><a href="http://www.youku.com/v/upload" target="_blank">我要上传</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:20px">
                            <img src="../../../images/sina.png"  width="140" height="50">
                        </td>
                        <td style="padding-top:20px">
                            <div style="margin-top: 5px"><a href="http://video.sina.com.cn/app/" target="_blank">手机客户端</a></div>
                            <div style="margin-top: 5px"><a href="http://upload.video.sina.com.cn/nupload.php" target="_blank">我要上传</a></div>
                        </td>
                        <td style="padding-left: 20px;padding-top:20px">
                            <img src="../../../images/sohu.png"  width="140" height="50">
                        </td>
                        <td style="padding-left: 20px;padding-top:20px">
                            <div style="margin-top: 5px"><a href="http://t.sohu.com/mphone/phonecatch" target="_blank">手机客户端</a></div>
                            <div style="margin-top: 5px"><a href="http://my.tv.sohu.com/user/video/upload.do" target="_blank">我要上传</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:20px;width: 300px " colspan="3">
                            没有拍视频？那就到这个网站找现成视频吧。
                        </td>
                        <td style="padding-top:20px;text-align: left; ">
                            <a href="http://shenzhen.loukoo.com/204069-%E6%B7%B1%E5%9C%B3-%E7%9A%87%E5%BA%AD%E5%A8%81%E5%B0%BC%E6%96%AF%E4%BA%BA%E5%B9%BF%E5%9C%BA.aspx"><img src="../../../images/loukoo.gif"  width="140" height="50"></a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"><h2>获取视频</h2>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">①输入视频地址②点击复制;③在房源描述里粘贴即可（快捷键Ctrl+V）.</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <input type="text" name="link" class="word_tip_ipt" style="width: 330px" id="link"
                                   value="如：http://www.baidu.com" onclick="if(this.value=='如：http://www.baidu.com'){this.value=''}" onblur="if(this.value==''){this.value='如：http://www.baidu.com'}">
                            <input type="button" name="copy" value="复制" class="word_tip_ipt2" onclick="copyLink()"
                                   style="margin-left: 10px"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/scripts/common.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script>


</script>
</body>
</html>