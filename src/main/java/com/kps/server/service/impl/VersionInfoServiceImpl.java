package com.kps.server.service.impl;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.dao.IVersionInfoDAO;
import com.kps.server.entity.VersionInfo;
import com.kps.server.service.IVersionInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 版本服务类
 * User: fei
 * Date: 13-11-24
 * Time: 下午9:42
 * To change this template use File | Settings | File Templates.
 */
@Service
public class VersionInfoServiceImpl implements IVersionInfoService {

    @Autowired
    private IVersionInfoDAO versionInfoDAO;

    /**
     * 根据客户端ID，查询版本号
     *
     * @param clientId
     * @return
     */
    @Override
    public BaseResultBean<VersionInfo> queryByClientId(String clientId) {
        BaseResultBean<VersionInfo> result = new BaseResultBean<VersionInfo>();
        VersionInfo version = versionInfoDAO.queryByClientId(clientId);
        result.setData(version);
        return result;
    }
}
