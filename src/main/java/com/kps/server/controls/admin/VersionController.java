package com.kps.server.controls.admin;

import com.kps.server.entity.VersionInfo;
import com.kps.server.service.IVersionInfoService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-16
 * Time: 下午10:08
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/admin/version")
public class VersionController {

    @Autowired
    private IVersionInfoService versionInfoService;

    @RequestMapping("/list_page")
    public ModelAndView listPage() {
        ModelAndView view = new ModelAndView();
        view.setViewName("/admin/version_list");
        return view;
    }

    /**
     * @return
     */
    @RequestMapping("/version_list")
    @ResponseBody
    public Map<String, Object> versionList() {
        List<VersionInfo> infos = versionInfoService.queryAllVersion();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("Rows", infos);
        result.put("Total", infos.size());
        return result;
    }

    /**
     * 修改版本
     *
     * @param id
     * @param version
     * @param versionInfo
     * @param clientId
     * @param mustUpgrade
     * @return
     */
    @RequestMapping("/update_version")
    @ResponseBody
    public Map<String, Object> updateVersion(int id, String version, String url, String versionInfo, String clientId, String mustUpgrade) {
        Map<String, Object> result = new HashMap<String, Object>();
        VersionInfo info = new VersionInfo();
        info.setId(id);
        info.setVersion(version);
        info.setVersionInfo(versionInfo);
        info.setClientId(clientId);
        info.setUrl(url);
        info.setMustUpgrade(StringUtils.equals("true", mustUpgrade));
        int row = versionInfoService.updateVersion(info);
        result.put("success", row > 0);
        return result;
    }
}
