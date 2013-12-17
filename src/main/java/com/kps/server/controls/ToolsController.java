package com.kps.server.controls;

import com.alibaba.fastjson.JSONObject;
import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.NewsInfo;
import com.kps.server.entity.ThTelInfo;
import com.kps.server.entity.ZxImages;
import com.kps.server.service.IToolsService;
import com.kps.server.service.IUserInfoService;
import com.kps.server.utils.StringUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-11-27
 * Time: 下午9:23
 */
@Controller
@RequestMapping("/tools")
public class ToolsController {

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IToolsService toolsService;

    /**
     * QQ在线
     *
     * @return
     */
    @RequestMapping("/qq_page")
    public ModelAndView qqPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tools/qq");
        mav.addObject("type", "qq");
        return mav;
    }

    /**
     * 预约看房copy界面
     *
     * @return
     */
    @RequestMapping("/sms_page")
    public ModelAndView smsPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tools/sms");
        mav.addObject("type", "sms");
        return mav;
    }

    /**
     * 获取用户可用短信条数
     *
     * @param mobile
     * @return
     */
    @RequestMapping("get_sms_count")
    @ResponseBody
    public Map<String, Object> getSmsCount(String mobile) {
        BaseResultBean<Integer> r = userInfoService.querySmsCount(mobile);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("count", r.getData());
        result.put("mobile", mobile);
        return result;
    }

    /**
     * 短信数量卡密续费基面
     *
     * @param phone
     * @return
     */
    @RequestMapping("/sms_renew")
    public ModelAndView smsRenew(String phone) {
        ModelAndView result = new ModelAndView();
        result.addObject("phone", phone);
        result.setViewName("tools/sms_renew");
        return result;
    }

    /**
     * 公告栏
     *
     * @return
     */
    @RequestMapping("/bulletin_board")
    public ModelAndView bulletinBoard() {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(9);
        result.addObject("images", images);
        result.setViewName("tools/bulletin_board");
        return result;
    }

    /**
     * 广告橱窗
     *
     * @return
     */
    @RequestMapping("/ad_show")
    public ModelAndView adShow() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/ad_show");
        return result;
    }

    /**
     * 标题图
     *
     * @param type
     * @return
     */
    @RequestMapping("/title_images/{type}")
    public ModelAndView titleImages(@PathVariable("type") int type) {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(type);
        result.addObject("images", images);
        result.addObject("type", type);
        result.setViewName("tools/title_images");
        return result;
    }

    /**
     * 图片素材
     *
     * @return
     */
    @RequestMapping("/image_material")
    public ModelAndView imageMaterial() {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(6);
        result.addObject("images", images);
        result.setViewName("tools/image_material");
        return result;
    }

    /**
     * 链接广告
     *
     * @return
     */
    @RequestMapping("/link_ads")
    public ModelAndView linkAds() {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(7);
        result.addObject("images", images);
        result.setViewName("tools/link_ads");
        return result;
    }

    /**
     * 同行鉴定
     *
     * @return
     */
    @RequestMapping("/tel_query_page")
    public ModelAndView tel_query_page() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/tel_query");
        return result;
    }

    @RequestMapping("/tel_query")
    @ResponseBody
    public Map<String, Object> thQuery(String tel) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        ThTelInfo info = toolsService.queryThTel(tel);
        result.put("find", info != null);

        //查询手机号码归属地
        if (info != null) {
            result.put("createDate", DateFormatUtils.format(info.getCreateTime(), "yyyy年MM月dd日"));
        }
        result.put("location", getLocation(tel));
        return result;
    }

    /**
     * 获取手机号码归属地
     *
     * @param tel
     * @return
     * @throws IOException
     */
    private String getLocation(String tel) throws IOException {
        try {
            String resp = Jsoup.connect("http://cz.115.com/?ct=index&ac=get_mobile_local&mobile=" + tel).get().toString();
            resp = resp.replaceAll("\\n\\s", "");
            resp = resp.replaceAll("&quot;", "\"");
            String pattern = "<body> (.*?)</body>";
            Pattern p = Pattern.compile(pattern);
            Matcher matcher = p.matcher(resp);
            if (matcher.find()) {
                resp = matcher.group(1);
            }
            resp = StringUtils.replace(StringUtils.replace(resp, ")", ""), "(", "");
            JSONObject jsonObject = JSONObject.parseObject(resp);
            return StringUtil.unescape(jsonObject.getString("province"));
        } catch (Exception e) {

        }
        return "";
    }

    @RequestMapping("import")
    public void importSf() throws FileNotFoundException {
        Scanner scanner = new Scanner(new FileInputStream(new File("C:\\Users\\jjs\\Desktop\\sssss.TXT")));
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            if (StringUtils.isNotEmpty(line)) {
                String[] lines = StringUtils.split(line, ",");
                ThTelInfo info = new ThTelInfo();
                info.setName(StringUtils.trim(lines[1]));
                info.setTel(StringUtils.trim(lines[2]));
                info.setCompany(StringUtils.trim(lines[4]));
                info.setHeadPic(StringUtils.trim(lines[5]));
                toolsService.saveThTel(info);
            }
        }
    }

    @RequestMapping("importTf")
    public void importTf() throws FileNotFoundException {
        Scanner scanner = new Scanner(new FileInputStream(new File("C:\\Users\\jjs\\Desktop\\ssssss.TXT")));
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            if (StringUtils.isNotEmpty(line)) {
                String[] lines = StringUtils.split(line, "\t");
                String[] tels = StringUtils.split(lines[0], "|");
                String[] urls = StringUtils.split(lines[1], "|");
                String[] companys = StringUtils.split(lines[2], "|");
                String[] names = StringUtils.split(lines[3], "|");
                for (int i=0, length = tels.length; i < length; i++) {
                    try {
                        ThTelInfo info = new ThTelInfo();
                        info.setName(names[i]);
                        info.setTel(tels[i]);
                        info.setCompany(StringUtils.split(companys[i],"&#12288;")[0]);
                        info.setBranchName(StringUtils.split(companys[i],"&#12288;")[1]);
                        info.setHeadPic(urls[i]);
                        toolsService.saveThTel(info);
                    }catch(Exception e) {

                    }
                }
            }
        }
    }

    /**
     * 加水印页面
     *
     * @return
     */
    @RequestMapping("/add_watermark")
    public ModelAndView addWatermark() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/add_watermark");
        return result;
    }


    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/mains")
    public ModelAndView mains() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/mains");
        return result;
    }

    /**
     * 头部页面
     *
     * @return
     */
    @RequestMapping("/head")
    public ModelAndView head() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/head");
        return result;
    }

    /**
     * 左边页
     *
     * @return
     */
    @RequestMapping("/left")
    public ModelAndView left() {
        ModelAndView result = new ModelAndView();
        List<NewsInfo> news = toolsService.queryAllNews();
        result.addObject("news", news);
        result.setViewName("tools/left");
        return result;
    }

}
