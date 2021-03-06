package com.kps.server.dao;

import com.kps.server.entity.VersionInfo;

import java.util.List;

/**
 * 版本信息DAO
 * User: fei
 * Date: 13-11-24
 * Time: 下午9:32
 * To change this template use File | Settings | File Templates.
 */
public interface IVersionInfoDAO {

    /**
     * 查询版本信息
     *
     * @param clientId
     * @return
     */
    public VersionInfo queryByClientId(String clientId);

    /**
     * 查询所以版本
     *
     * @return
     */
    public List<VersionInfo> queryAllVersion();

    /**
     * 修改版本
     * @param info
     * @return
     */
    public int updateVersion(VersionInfo info);
}
