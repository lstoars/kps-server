package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.*;
import com.kps.server.service.ICommunityInfoService;
import com.kps.server.service.IToolsService;
import com.kps.server.service.IUserInfoService;
import com.kps.server.utils.VideoUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private ICommunityInfoService communityInfoService;

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
        List<CompanyInfo> companys = toolsService.queryAllCompany();
        result.addObject("companys", companys);
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
        result.addObject("history", toolsService.queryThHistory());
        result.setViewName("tools/tel_query");
        return result;
    }

    @RequestMapping("/tel_query")
    @ResponseBody
    public Map<String, Object> thQuery(String tel) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        ThTelInfo info = toolsService.queryThTel(tel);
        result.put("find", info != null);
        if (info != null) {
            result.put("company", info.getCompany());
            result.put("name", info.getName());
        }
        return result;
    }

    @RequestMapping("/query_community")
    @ResponseBody
    public Map<String, Object> queryCommunity(String keys) {
        Map<String, Object> result = new HashMap<String, Object>();
        List<CommunityInfo> infos = communityInfoService.queryCommunity(keys);
        result.put("success", true);
        result.put("infos", infos);
        return result;
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
     * 视频看房
     *
     * @return
     */
    @RequestMapping("/video")
    public ModelAndView video() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/video");
        return result;
    }

    @RequestMapping(value = "/get_video_url")
    @ResponseBody
    public Map<String, Object> getVideoUrl(String url) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtils.isEmpty(url)) {
            result.put("success", false);
            result.put("msg", "参数错误！");
            return result;
        }

        String videoUrl = VideoUtils.getVideoUrl(url);
        result.put("videoUrl", videoUrl);
        if (StringUtils.isEmpty(videoUrl)) {
            result.put("success", false);
        } else {
            result.put("success", true);
        }
        return result;
    }

    @RequestMapping(value = "/add_user_feed"/*, method = RequestMethod.POST*/)
    @ResponseBody
    public Map<String, Object> addUserFeed(int type, String content) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (type < 0 || StringUtils.isEmpty(content)) {
            result.put("success", false);
            result.put("msg", "参数错误！");
            return result;
        }

        boolean r = toolsService.saveUserFeed(type, content);
        result.put("success", r);
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
