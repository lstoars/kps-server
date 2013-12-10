package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.ZxImages;
import com.kps.server.service.ICardCodeService;
import com.kps.server.service.IToolsService;
import com.kps.server.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    /**
     * QQ在先
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
     * 文字特效
     *
     * @return
     */
    @RequestMapping("/text_effects")
    public ModelAndView textEffects() {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(9);
        result.addObject("images", images);
        result.setViewName("tools/text_effects");
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

    @RequestMapping("/zx_images/{type}")
    public ModelAndView zxImages(@PathVariable("type") int type) {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(type);
        result.addObject("images", images);
        result.addObject("type",type);
        result.setViewName("tools/zx_images");
        return result;
    }

    @RequestMapping("/smallImg")
    public ModelAndView smallImg() {
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(6);
        result.addObject("images", images);
        result.setViewName("tools/small_images");
        return result;
    }

    @RequestMapping("/ad_sc")
    public ModelAndView adSc(){
        ModelAndView result = new ModelAndView();
        List<ZxImages> images = toolsService.queryByType(7);
        result.addObject("images", images);
        result.setViewName("tools/ad_sc");
        return result;
    }

    @RequestMapping("/mains")
    public ModelAndView mains() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/mains");
        return result;
    }

    @RequestMapping("/head")
    public ModelAndView head() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/head");
        return result;
    }

    @RequestMapping("/left")
    public ModelAndView left() {
        ModelAndView result = new ModelAndView();
        result.setViewName("tools/left");
        return result;
    }
}
