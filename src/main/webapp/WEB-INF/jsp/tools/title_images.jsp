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
            margin: 5px 0 0 0;
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

        .btns {
            border-bottom: 1px solid #ccc;;
        }

        .btns a:link, .btns a:active, .btns a:visited, .btns a:hover {
            display: inline-block;
            height: 24px;
            border: 1px solid #ccc;
            border-bottom: none;
            color: #333;
            font: normal 12px/24px "SinSun";
            text-decoration: none;
            padding: 0 8px;
            float: left;
            margin-right: 5px;;
        }

        .btns a.current {
            background: #ccc;
            color: #000;
        }

        .cred {
            color: #f00;
        }
        .c_div {
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
                        <td><span style="color: red">①选择图片双击;②在房源描述里粘贴即可（快捷键Ctrl+V）</span>
                            <a href="http://www.fangrukou.com/make.htm" target="_blank" style="margin-left: 10px">不会用，点这看教程！</a>
                        </td>
                    </tr>
                    <tr style="margin-top: 5px">
                        <td class="btns">
                            <a href="/kps/tools/title_images/1">主题1</a>
                            <a href="/kps/tools/title_images/2">主题2</a>
                            <a href="/kps/tools/title_images/3">主题3</a>
                            <a href="/kps/tools/title_images/4">主题4</a>
                            <a href="/kps/tools/title_images/5">主题5</a>
                        </td>
                    </tr>
                        <c:forEach items="${images}" var="image" varStatus="status">
                            <tr>
                                <td class="col1" style="padding-top: 5px">
                                    <c:if test="${status.index==0}">
                                        <div  ondblclick="clickGs()" id="image_gongsi">
                                            <img src="${image.path}" alt="" image_id=${image.id}>
                                        </div>
                                    </c:if>
                                    <c:if test="${status.index==1}">
                                        <div  ondblclick="clickXiaoqu(this)" id="image_xiaoqu">
                                            <img src="${image.path}" alt="" image_id=${image.id}>
                                        </div>
                                    </c:if>
                                    <c:if test="${status.index gt 1}">
                                        <div  ondblclick="copyContent2(this)" id="image_${image.id}">
                                            <img src="${image.path}" alt="" image_id=${image.id}>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                            <c:if test="${(status.index+1)==1}">
                                <tr>
                                    <td id="company_show_area">

                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${(status.index+1)==2}">
                                <tr>
                                    <td id="community_show_area">

                                    </td>
                                </tr>
                                <tr><td style="padding-top:10px;padding-bottom:10px "><div class="split_line"></div></td></tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="c_div" id="cp_div" >

</div>

<div class="c_div" id="xiaoqu_input_div">
小区：<input type="text"  class="word_tip_ipt" name="xx" id="commId" value="在此输入小区名、拼音缩写" onclick="if(this.value=='在此输入小区名、拼音缩写'){this.value=''}"
          onblur="if(this.value==''){this.value='在此输入小区名、拼音缩写'}"
          onkeyup="getCommunity({thisId:'commId',trafficId:'trafficId',supportsId:'supportsId',descriptionId:'descriptionId'})"><br/>
    <span style="color: red;font-size: 12px">该功能尚处于测试阶段，明日正式开放</span>
</div>

<div class="c_div" id="company_select_div">
    选择公司：<select id="company" name="company">
        <c:forEach items="${companys}" var="company" varStatus="status">
            <option value="${company.id}" img="${company.imgUrl}" desc="${company.description}">${company.name}</option>
        </c:forEach>
    </select>
</div>

<div class="c_div" id="community_copy_content">
    <div class="content pt20" style="width: 700px" id="xiaoqu_copy_content">
        <div style="width:100%">
            <div style="border-bottom:1px solid #ccc; position:relative; font-size:12px; padding:10px 0;">
                <div style="width:100px; position:absolute; text-align:center;">
                    <p style="padding-top:3px;"><img
                            src="http://ww2.sinaimg.cn/mw690/90f49884gw1ebzp2m0rr2j201x01xdfn.jpg"/></p>
                    <p style="padding-top:5px; font-weight:bold;">交通配套</p>
                </div>
                <div style="padding:0 10px 0 110px; line-height:22px; color:#333;" id="trafficId">

                </div>
            </div>

            <div style="border-bottom:1px solid #ccc; position:relative; font-size:12px; padding:10px 0;">
                <div style="width:100px; position:absolute; text-align:center;">
                    <p style="padding-top:3px;"><img
                            src="http://ww2.sinaimg.cn/mw690/90f49884gw1ebzp2mww0zj201x01yglf.jpg"/></p>

                    <p style="padding-top:5px; font-weight:bold;">小区配套</p>
                </div>
                <div style="padding:0 10px 0 110px; line-height:22px; color:#333;" id="supportsId">

                </div>
            </div>

            <div style="border-bottom:1px solid #ccc; position:relative; font-size:12px; padding:10px 0;">
                <div style="width:100px; position:absolute; text-align:center;">
                    <p style="padding-top:3px;"><img
                            src="http://ww1.sinaimg.cn/mw690/90f49884gw1ebzp2l9r21j201x01yglf.jpg"/></p>
                    <p style="padding-top:5px; font-weight:bold;">楼盘概述</p>
                </div>
                <div style="padding:0 10px 0 110px; line-height:22px; color:#333;">
                    <p style="text-indent:24px; word-break:break-all;" id="descriptionId">
                    </p>
                </div>
            </div>
            <p style="text-align:right;padding-top:5px;"><a style="font-size:12px; text-decoration:none; color:#1053ad;"
                                                            href="http://www.fangrukou.com">此信息由房入口提供</a></p>
        </div>
    </div>
    <div style="text-align: center">
        <input type="button" name="copy" value="复制" class="word_tip_ipt2"
               onclick="copyCommunityYs()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="copy" value="只复制图片" class="word_tip_ipt2"
               onclick="copyImage('image_xiaoqu')"  style=" width: 80px;"/>
    </div>
</div>

<div class="c_div" id="company_copy_div">
    <div style="width:700px; line-height:20px;margin-top: 5px" id="company_copy_content">
        <img id="company_logo_img" src="" style="float:left; width:170px; height:60px; margin:0 5px 0 0;" /><span id="company_desc" style="font-size:12px; line-height:22px; color:#333;"></span>
    </div>
    <div style="text-align: center">
        <input type="button" name="copy" value="复制" class="word_tip_ipt2"
               onclick="copyCompanyDesc()"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="copy" value="只复制图片" class="word_tip_ipt2"
               onclick="copyImage('image_gongsi')" style=" width: 80px;"/>
    </div>
</div>

<script type="text/javascript">
    function copyImage(id) {
        div = document.getElementById(id);
        copyContent2(div);
    }

    function copyCompanyDesc(){
        var companyHtml = "<div style=\"width:700px; line-height:20px;margin-top: 5px\">" + $("#company_copy_content").html()+"</div>";
        var imageHtml = "<div class=\"c_div\">"+$("#image_gongsi").html()+"</div>";
        var html = imageHtml+companyHtml;
        $("#cp_div").html(html);
        div = document.getElementById("cp_div");
        copyContent2(div);
    }

    function copyCommunityYs() {
        var communityHtml = "<div class=\"content pt20\" style=\"width: 700px;margin-top: 5px\""+ $("#xiaoqu_copy_content").html()+"</div>";
        var imageHtml = "<div class=\"c_div\">"+$("#image_xiaoqu").html()+"</div>";
        var html = imageHtml+communityHtml;
        $("#cp_div").html(html);
        div = document.getElementById("cp_div");
        copyContent2(div);
    }

    function clickGs() {
        $("#cp_div").html("");
        $("#community_show_area").html("");
        $("#company_show_area").html("");
        art.dialog({
            padding: '10px',
            esc: false,
            lock: true,
            width: '400px',
            title: "请选择公司",
            content: document.getElementById("company_select_div"),
            okVal: "确定",
            ok: function () {
                var img = $("select[name=company]").find("option:selected").attr("img");
                var desc = $("select[name=company]").find("option:selected").attr("desc");
                $("#company_logo_img").attr("src",img);
                $("#company_desc").html("&nbsp;&nbsp;&nbsp;&nbsp;"+desc);
                $("#company_show_area").html($("#company_copy_div").html());
            }
        });
    }
    var dialog;
    function clickXiaoqu() {
        $("#cp_div").html("");
        $("#community_show_area").html("");
        $("#company_show_area").html("");
        dialog =  art.dialog({
            padding: '10px',
            esc: false,
            lock: true,
            width: '400px',
            title: "选择小区",
            content: document.getElementById("xiaoqu_input_div"),
            okVal: "确定",
            ok: function () {

            }
        });
    }
</script>
<script type="text/javascript" src="http://i.jjshome.com/js/common/artDialog/artDialog.source.js?skin=green"
        charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="/scripts/common.js"></script>
<script src="/scripts/get_community.js"></script>
</body>
</html>