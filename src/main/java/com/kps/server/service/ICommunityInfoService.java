package com.kps.server.service;

import com.kps.server.entity.CommunityInfo;

import java.util.List;

/**
 * 楼盘字典服务
 * User: fei
 * Date: 13-12-28
 * Time: 下午3:40
 * To change this template use File | Settings | File Templates.
 */
public interface ICommunityInfoService {

    /**
     * 保存楼盘字典信息
     *
     * @param info
     * @return
     */
    public boolean saveCommunityInfo(CommunityInfo info);

    /**
     * 查询楼盘字典
     *
     * @param keys
     * @return
     */
    public List<CommunityInfo> queryCommunity(String keys);
}
