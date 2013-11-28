package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.VersionInfo;
import com.kps.server.service.ICardCodeService;
import com.kps.server.service.IVersionInfoService;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 卡密认证
 * User: fei
 * Date: 13-11-24
 * Time: 下午1:22
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/cc")
public class CardCodeController {

    @Autowired
    private ICardCodeService cardCodeService;

    @Autowired
    private IVersionInfoService versionInfoService;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/auth")
    @ResponseBody
    public Map<String, Object> auth(String code, String uname, String clientId) {
        BaseResultBean<CardCode> result = cardCodeService.verfifyCode(code, uname,clientId);

        Map<String, Object> r = new LinkedHashMap<String, Object>();
        r.put("success", result.isSuccess());
        r.put("errorMsg", result.getErrorMessage());

        if (result.isSuccess()) {
            r.put("endTime", DateFormatUtils.format(result.getData().getEndTime(), "yyyy-MM-dd HH:mm:ss"));
        }

        BaseResultBean<VersionInfo> versionResult = versionInfoService.queryByClientId(clientId);
        if (versionResult.isSuccess() && null != versionResult.getData()) {
            r.put("version", versionResult.getData().getVersion());
            r.put("url", versionResult.getData().getUrl());
            r.put("versionInfo", versionResult.getData().getVersionInfo());
            r.put("mustUpgrade", versionResult.getData().isMustUpgrade());
            r.put("clientId", versionResult.getData().getClientId());
        }
        return r;
    }

}
