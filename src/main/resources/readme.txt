1、
56网
http://upload.56.com/v/
手机端
http://mobile.56.com/video


2、
新浪视频
http://upload.video.sina.com.cn/nupload.php
手机端
http://upload.video.sina.com.cn/nupload.php


3、
优酷网
http://www.youku.com/v/upload
手机端
http://mobile.youku.com/index/paike


4、
搜狐视频
http://my.tv.sohu.com/user/video/upload.do
手机端
http://t.sohu.com/mphone/phonecatch



测试视频网址：
1、楼库网
http://shenzhen.loukoo.com/204069-%E6%B7%B1%E5%9C%B3-%E7%9A%87%E5%BA%AD%E5%A8%81%E5%B0%BC%E6%96%AF%E4%BA%BA%E5%B9%BF%E5%9C%BA.aspx

抽取html正则 type="text" id="ContentPlaceHolderMain_txtFlashCode" size="22" value="([^"]*?)"
2、56
http://www.56.com/u88/v_MTA1MTk4MDA1.html
抽取URL正则：v_(.*)\.html
id:MTA1MTk4MDA1
"http://player.56.com/v_"+id+".swf"

3、新浪
http://video.sina.com.cn/p/ent/2014-01-20/100163414433.html
抽取html正则：swfOutsideUrl:'([^']*)',
4、优酷
http://v.youku.com/v_show/id_XNjA0MTc0MjM2.html
抽取URL正则：/([^//]*)/v
id:XNjA0MTc0MjM2
http://player.youku.com/player.php/sid/XNjA0MTc0MjM2/v.swf

5、搜狐视频
http://tv.sohu.com/20140122/n393942373.shtml
抽取html正则："(.*)&autoplay=false"


需求即：用户输入视频的网站，点击复制。我们到他网址上取到swf，拼成视频显示，让他去粘贴。




经纪人工具箱添新功能，简单2步为房源添加视频看房功能。免费下载使用：http://fangrukou.com/tools.html