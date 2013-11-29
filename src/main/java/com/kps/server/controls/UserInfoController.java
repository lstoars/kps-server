package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.UserInfo;
import com.kps.server.entity.VersionInfo;
import com.kps.server.service.IUserInfoService;
import com.kps.server.service.IVersionInfoService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
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

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String uname, String clientId) {
        BaseResultBean<UserInfo> info = userInfoService.login(uname, clientId);
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        result.put("success", info.isSuccess());
        result.put("errorMsg", info.getErrorMessage());

        if (info.isSuccess() && info.getData().getEndTime() != null) {
            result.put("endTime", DateFormatUtils.format(info.getData().getEndTime(),
                    "yyyy-MM-dd"));
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
    public Map<String, Object> recharge(String uname, String clientId, String code) {
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        if (StringUtils.isEmpty(uname) || StringUtils.isEmpty(clientId)
                || StringUtils.isEmpty(code)) {
            result.put("success", false);
            result.put("errorMsg", "PARAM_ERROR");
        }

        BaseResultBean<UserInfo> info = userInfoService.recharge(uname, clientId, code);
        result.put("success", info.isSuccess());
        result.put("errorMsg", info.getErrorMessage());
        if (info.isSuccess() && info.getData().getEndTime() != null) {
            result.put("endTime", DateFormatUtils.format(info.getData().getEndTime(),
                    "yyyy-MM-dd"));
        } else if (info.isSuccess() && info.getData().getSmsCount() != 0) {
            result.put("smsCount", info.getData().getSmsCount() - info.getData().getSmsUseCount());
        }
        return result;
    }


    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IVersionInfoService versionInfoService;
}
