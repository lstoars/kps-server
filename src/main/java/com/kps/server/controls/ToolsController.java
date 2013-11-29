package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.CardCode;
import com.kps.server.service.ICardCodeService;
import com.kps.server.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
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

    @RequestMapping("/qq_page")
    public ModelAndView qqPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tools/qq");
        return mav;
    }

    @RequestMapping("/sms_page")
    public ModelAndView smsPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tools/sms");
        return mav;
    }

    @RequestMapping("get_sms_count")
    @ResponseBody
    public Map<String, Object> getSmsCount(String mobile) {
        BaseResultBean<Integer> r = userInfoService.querySmsCount(mobile);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("count", r.getData());
        result.put("mobile", mobile);
        return result;
    }

    @RequestMapping("/sms_renew")
    public ModelAndView smsRenew(String phone) {
        ModelAndView result = new ModelAndView();
        result.addObject("phone", phone);
        result.setViewName("tools/sms_renew");
        return result;
    }
}
