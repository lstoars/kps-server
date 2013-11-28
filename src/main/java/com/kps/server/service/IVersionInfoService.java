package com.kps.server.service;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.VersionInfo;

/**
 * 版本服务类
 * User: fei
 * Date: 13-11-24
 * Time: 下午9:41
 * To change this template use File | Settings | File Templates.
 */
public interface IVersionInfoService {

    /**
     * 根据客户端ID，查询版本号
     *
     * @param clientId
     * @return
     */
    public BaseResultBean<VersionInfo> queryByClientId(String clientId);

}
