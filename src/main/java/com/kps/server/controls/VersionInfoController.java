package com.kps.server.controls;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.VersionInfo;
import com.kps.server.service.IVersionInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 版本信息
 * User: fei
 * Date: 13-11-24
 * Time: 下午10:14
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/version")
public class VersionInfoController {

    @Autowired
    private IVersionInfoService versionInfoService;

    @RequestMapping("/get")
    @ResponseBody
    public Map<String, Object> getVersion(String clientId) {
        BaseResultBean<VersionInfo> versionResult = versionInfoService.queryByClientId(clientId);
        Map<String, Object> r = new HashMap<String, Object>();
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
