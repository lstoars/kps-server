package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.UserInfo;
import com.kps.server.entity.VersionInfo;
import com.kps.server.service.IUserInfoService;
import com.kps.server.service.IVersionInfoService;
import com.kps.server.utils.MD5Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 用户控制类
 * User: hcf
 * Date: 13-11-29
 * Time: 下午6:14
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserInfoController {

    private static final String TOKEN_KEY = "T3-EZ05ZDeRf$W*V*f@Eoe(W[iC+Zy";

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String uname, String clientId) {
        BaseResultBean<UserInfo> info = userInfoService.login(uname, clientId);
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        result.put("success", info.isSuccess());
        result.put("errorMsg", info.getErrorMessage());

        if (info.getData() != null && info.getData().getEndTime() != null) {
            result.put("endTime", DateFormatUtils.format(info.getData().getEndTime(),
                    "yyyy-MM-dd"));
        } else {
            result.put("endTime", "ERROR");
        }

        BaseResultBean<VersionInfo> versionResult = versionInfoService.queryByClientId(clientId);
        if (versionResult.isSuccess() && null != versionResult.getData()) {
            result.put("version", versionResult.getData().getVersion());
            result.put("url", versionResult.getData().getUrl());
            result.put("versionInfo", versionResult.getData().getVersionInfo());
            result.put("mustUpgrade", versionResult.getData().isMustUpgrade());
            result.put("clientId", versionResult.getData().getClientId());
        }
        return result;
    }

    @RequestMapping("/recharge")
    @ResponseBody
    public Map<String, Object> recharge(String uname, String clientId, String code, String token) {
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        String t = MD5Utils.MD5(code + TOKEN_KEY);
        if (!StringUtils.equalsIgnoreCase(t, token)) {
            result.put("success", false);
            result.put("errorMsg", "非法请求");
        }

        if (StringUtils.isEmpty(uname) || StringUtils.isEmpty(clientId)
                || StringUtils.isEmpty(code)) {
            result.put("success", false);
            result.put("errorMsg", "PARAM_ERROR");
        }

        try {
            BaseResultBean<UserInfo> info = userInfoService.recharge(uname, clientId, code);
            result.put("success", info.isSuccess());
            result.put("errorMsg", info.getErrorMessage());
            if (info.isSuccess() && info.getData().getEndTime() != null) {
                result.put("endTime", DateFormatUtils.format(info.getData().getEndTime(),
                        "yyyy-MM-dd"));
            } else if (info.isSuccess() && info.getData().getSmsCount() != 0) {
                result.put("smsCount", info.getData().getSmsCount() - info.getData().getSmsUseCount());
            } else {
                result.put("endTime", "ERROR");
            }
        } catch (Exception e) {
            logger.error("UserInfoController@recharge error", e);
            result.put("success", false);
            result.put("errorMsg", "SYSTEM_ERROR");
        }
        return result;
    }

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IVersionInfoService versionInfoService;
}
