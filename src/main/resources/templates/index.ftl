<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="房产导航,深圳房产,房入口,房产网站大全,房产网站,房产网址,房产网址大全"/>
    <meta name="description"
          content="房入口，最懂经纪人的导航网站，提供最权威的经纪人工具箱、刷榜神器、端口登陆、群发端口等房产相关网站。包括：搜房网、赶集网、58同城、新浪乐居、深圳房产、安居客等。"/>
    <title>房入口 - 房产导航,房产网站入口</title>
</head>
<link rel="stylesheet" type="text/css" href="styles/index.css"/>
<link rel="icon" href="myicos.ico" type="image/x-icon"/>
<body>
<div class="frk_top">
    <div class="frk_wrap clearfix">
        <span class="download clearfix">
        	<i class="m3"></i><a
                href="http://www.fangrukou.com/%E6%88%BF%E5%85%A5%E5%8F%A3-%E6%88%BF%E4%BA%A7%E7%BD%91%E5%9D%80%E5%A4%A7%E5%85%A8.url"
                target="_blank">下载房入口桌面端</a>
        </span>
        <ul>
            <li><a id="setHome" href="javascript:void(0);" onclick="SetHome(this,'http://www.fangrukou.com');"><i
                    class="m1"></i><span>设为首页</span></a></li>
            <li><a href="suggestion.html"><i class="m2"></i><span>意见反馈</span></a></li>
        </ul>
    </div>
</div>
<div class="frk_wrap">
<div class="bannerwrap clearfix mt10">
    <a href="index.html" class="logo">&nbsp;</a>

    <div class="search_wrap">
        <form action="http://www.baidu.com/baidu" target="_blank">
            <table bgcolor="#FFFFFF">
                <tr>
                    <td>
                        <input name=tn type=hidden value=baidu>

                        <div class="baidu_input_wrap">
                            <input id="kw" type=text name=word size=30 baiduSug=1 class="baidu_input">
                        </div>
                        <input type="submit" value="百度一下" class="search_button">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="erwei fr">
        <i class="m0"></i>

        <p class="f12 pt55 tc">微信扫一扫</p>
    </div>
</div>

<div class="links_wrap clearfix mt20 hover_bgs">
    <div class="links_title">
        <span class="tx1">深圳成交数据</span>

        <p class="cred pt5">(${today})</p>
    </div>
    <div class="links_all clearfix">
           <span class="hover_wrap">
            	<a href="javascript:;">一手楼成交</a>
                <span class="hover_div">
                   <ul class="list list3">
                       <ol class="clearfix"><span class="w3">成交套数</span><span class="w3">成交面积</span><span class="w3">可售套数</span><span
                               class="w3">可售面积</span></ol>
                       <li class="clearfix"><span class="w3">${xfCjCount}</span><span class="w3">${xfCjArea}</span><span
                               class="w3">${xfSyCount}</span><span class="w3">${xfSyArea}</span></li>
                   </ul>
                </span>
            </span>
            <span class="hover_wrap">
            	<a href="javascript:;">二手楼成交</a>
                <span class="hover_div">
                   <ul class="list list4">
                       <ol class="clearfix"><span class="w3">成交套数</span><span class="w3">成交面积</span></ol>
                       <li class="clearfix"><span class="w3">${esCjCount}</span><span class="w3">${esCjArea}</span></li>
                   </ul>
                </span>
            </span>
            <span class="hover_wrap">
            	<a href="javascript:;">二手房成交前十中介机构</a>
                <span class="hover_div">
                   <ul class="list">
                       <ol class="clearfix"><span class="w1">机构名称</span><span class="w2">套数</span><span
                               class="w3">建筑面积</span></ol>
                   <#list esfTop10 as esf>
                       <li class="clearfix"><span class="w1">${esf[0]}</span><span class="w2">${esf[1]}</span><span
                               class="w3">${esf[2]}</span></li>
                   </#list>
                   </ul>
                </span>
            </span>
            <span class="hover_wrap">
            	<a href="javascript:;">一手房成交前十楼盘</a>
                <span class="hover_div">
                   <ul class="list list2">
                       <ol class="clearfix"><span class="w4">楼盘名称</span><span class="w2">套数</span><span
                               class="w3">建筑面积</span></ol>
                   <#list xfTop10 as xf>
                       <li class="clearfix"><span class="w4">${xf[0]}</span><span class="w2">${xf[1]}</span><span
                               class="w3">${xf[2]}</span></li>
                   </#list>
                   </ul>
                </span>
            </span>
    </div>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">必备工具</span><span class="tx2">(2)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="tools.html" target="_blank" class="ico">经纪人工具箱<i class="hot"></i></a></li>
        <li><a href="shenqi.html" target="_blank" class="ico">刷榜神器<i class="hot"></i></a></li>
        <!--<li><a href="http://hi.baidu.com/fangrukou" target="_blank" class="ico">房入口博客</a></li>-->
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">端口登陆</span><span class="tx2">(12)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://agent.soufun.com/" target="_blank">搜房帮</a></li>
        <li><a href="http://market.szhome.com/" target="_blank">深房网</a></li>
        <li><a href="http://my.anjuke.com/login/" target="_blank">安居客</a></li>
        <li><a href="http://vip.esf.focus.cn/login.php" target="_blank">搜狐焦点</a></li>
        <li><a href="http://passport.bendibao.com/home/login.asp?citycode=sz" target="_blank">本地宝</a></li>
        <li><a href="https://passport.ganji.com/login.php" target="_blank">赶集网</a></li>
        <li><a href="http://passport.58.com/login/" target="_blank">58同城</a></li>
        <li><a href="http://j.esf.sina.com.cn/login" target="_blank">新浪乐居</a></li>
        <li><a href="http://www.taofw.cn/login.aspx" target="_blank">淘房屋</a></li>
        <li><a href="http://sz.fangjia.com/" target="_blank">房价网</a></li>
        <li><a href="http://www.99fang.com/user/login/" target="_blank">九九房</a></li>
        <li><a href="http://passport.taofang.com/user/login" target="_blank">淘房网</a></li>
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">群发端口</span><span class="tx2">(4)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.zushou365.com/" target="_blank">租售365</a></li>
        <li><a href="http://www.todgo.com/" target="_blank">土地公</a></li>
        <li><a href="http://sz.fangtan007.com/" target="_blank">房探网</a></li>
        <li><a href="http://www.tuitui99.com/" target="_blank">推推99</a></li>
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">房产工具</span><span class="tx2">(5)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://sz.o.cn/" target="_blank">深圳3D地图</a></li>
        <li><a href="http://www.szpl.gov.cn/zxbs/xxcxfw/jsjg/" target="_blank">存量房计税价格</a></li>
        <li><a href="http://ris.szpl.gov.cn/MLS/Index.aspx" target="_blank">房源编码查询</a></li>
        <li><a href="http://app.baidu.com/app/enter?appid=327605" target="_blank">税费计算器</a></li>
        <li><a href="http://app.baidu.com/justzxjsq" target="_blank">装修预算</a></li>
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">经纪公司</span><span class="tx2">(15)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.jjshome.com/" target="_blank">家家顺</a></li>
        <li><a href="http://sz.centanet.com/" target="_blank">中原地产</a></li>
        <li><a href="http://www.zlhome.com/" target="_blank">中联地产</a></li>
        <li><a href="http://www.48dc.com/" target="_blank">世华地产</a></li>
        <li><a href="http://www.midland.com.cn/" target="_blank">美联物业</a></li>
        <li><a href="http://www.worldunion.com.cn/" target="_blank">世联地产</a></li>
        <li><a href="http://www.hkpchina.com.cn/" target="_blank">港置地产</a></li>
        <li><a href="http://www.cmpc.cn/" target="_blank">招商置业</a></li>
        <li><a href="http://www.tzh.cn/" target="_blank">同致行</a></li>
        <li><a href="http://www.century21cn.com/" target="_blank">泛城地产</a></li>
        <li><a href="http://www.honorland.com/" target="_blank">尊地地产</a></li>
        <li><a href="http://www.dtz.com/" target="_blank">戴德梁行</a></li>
        <li><a href="http://www.ideastate.com/" target="_blank">爱地时代</a></li>
        <li><a href="http://www.hwcity.com.cn/" target="_blank">海王城地产</a></li>
        <li><a href="http://www.xfdc.com.cn/" target="_blank">新峰地产</a></li>
    </ul>
</div>


<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">办事易</span><span class="tx2">(10)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.szsi.gov.cn/" target="_blank">深圳社保管理局</a></li>
        <li><a href="http://www.szzfgjj.com/" target="_blank">深圳住房公积金</a></li>
        <li><a href="http://www.szhrss.gov.cn/" target="_blank">深圳保障局</a></li>
        <li><a href="http://www.sz3e.com/" target="_blank">深圳公安局出入境</a></li>
        <li><a href="http://203.91.45.154/" target="_blank">深圳居住证综合信息网</a></li>
        <li><a href="http://e.szsi.gov.cn/" target="_blank">深圳社保个人网页</a></li>
        <li><a href="http://203.91.44.117/" target="_blank">深圳市国土局</a></li>
        <li><a href="http://ris.szpl.gov.cn/" target="_blank">市房地产信息系统</a></li>
        <li><a href="http://www.szpl.gov.cn/szupb/" target="_blank">深圳市城市规划</a></li>
        <li><a href="http://www.srba.net.cn/" target="_blank">市房地产经纪行业协会</a></li>
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">招聘求职</span><span class="tx2">(10)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.58.com/zhaopin/" target="_blank">58招聘</a></li>
        <li><a href="http://sz.ganji.com/zhaopin/" target="_blank">赶集招聘</a></li>
        <li><a href="http://www.51job.com/" target="_blank">前程无忧</a></li>
        <li><a href="http://www.zhaopin.com/" target="_blank">智联招聘</a></li>
        <li><a href="http://www.chinahr.com/" target="_blank">中华英才网</a></li>
        <li><a href="http://www.cjol.com/" target="_blank">中国人才热线</a></li>
        <li><a href="http://www.lietou.com/" target="_blank">猎聘网</a></li>
        <li><a href="http://opendata.baidu.com/zhaopinhui/s?rn=20&wd=%D5%D0%C6%B8%BB%E1" target="_blank">招聘会信息</a></li>
        <li><a href="http://www.yingjiesheng.com/" target="_blank">应届生求职网</a></li>
        <li><a href="http://www.jobcn.com/" target="_blank">卓博人才网</a></li>
    </ul>
</div>

<div class="links_wrap clearfix">
    <div class="links_title">
        <span class="tx1">网上银行</span><span class="tx2">(15)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.icbc.com.cn/" target="_blank">工商银行</a></li>
        <li><a href="http://www.ccb.com/" target="_blank">建设银行</a></li>
        <li><a href="http://www.boc.cn/" target="_blank">中国银行</a></li>
        <li><a href="http://www.bankcomm.com/" target="_blank">交通银行</a></li>
        <li><a href="http://www.abchina.com/" target="_blank">农业银行</a></li>
        <li><a href="http://www.cmbchina.com/" target="_blank">招商银行</a></li>
        <li><a href="http://www.psbc.com/" target="_blank">邮政银行</a></li>
        <li><a href="http://www.cebbank.com.cn/" target="_blank">光大银行</a></li>
        <li><a href="http://www.cmbc.com.cn/" target="_blank">民生银行</a></li>
        <li><a href="http://bank.pingan.com/" target="_blank">平安银行</a></li>
        <li><a href="http://www.spdb.com.cn/" target="_blank">浦发银行</a></li>
        <li><a href="http://bank.ecitic.com/" target="_blank">中信银行</a></li>
        <li><a href="http://www.cib.com.cn/" target="_blank">兴业银行</a></li>
        <li><a href="http://www.hxb.com.cn/" target="_blank">华夏银行</a></li>
        <li><a href="http://www.cgbchina.com.cn/" target="_blank">广发银行</a></li>
    </ul>
</div>

<div class="links_wrap clearfix has-bor-bo">
    <div class="links_title">
        <span class="tx1">软件下载</span><span class="tx2">(11)</span>
    </div>
    <ul class="links_all clearfix">
        <li><a href="http://www.cr173.com/" target="_blank">西西软件园</a></li>
        <li><a href="http://www.greenxf.com/" target="_blank">绿色先锋下载</a></li>
        <li><a href="http://www.3987.com/" target="_blank">统一下载站</a></li>
        <li><a href="http://www.pc0359.cn/" target="_blank">河东软件站</a></li>
        <li><a href="http://www.xiazaiba.com/" target="_blank">下载吧</a></li>
        <li><a href="http://www.jz5u.com/" target="_blank">JZ5U绿色下载站</a></li>
        <li><a target="_blank" href="http://www.piaodown.com/">飘荡软件</a></li>
        <li><a href="http://www.ddooo.com/" target="_blank">多多软件站</a></li>
        <li><a href="http://www.pc6.com/" target="_blank">pc6官方下载</a></li>
        <li><a href="http://www.xdowns.com/" target="_blank">绿盟软件</a></li>
        <li><a href="http://www.crsky.com/" target="_blank">霏凡软件</a></li>
    </ul>
</div>
<div class="footer mt10">
    <p class="tc"><a href="http://www.fangrukou.com" class="gray">关于Fangrukou.com</a><a href="http://www.fangrukou.com/suggestion.html?from=hz"
                                                                                        class="gray ml20">申请合作</a></p>

    <p class="tc mt5 c999 pb20">©Fangrukou.com 房入口 房产导航</p>
</div>
</div>
<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="scripts/index.js"></script>
<div style="display:none;">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe0a6c9ff8b3f4483ac16fdd2a5c5577c' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>
</body>

</html>
