package com.kps.server.service.impl;

import com.kps.server.dao.ICommunityInfoDAO;
import com.kps.server.entity.CommunityInfo;
import com.kps.server.service.ICommunityInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 楼盘字典服务实现
 * User: fei
 * Date: 13-12-28
 * Time: 下午3:41
 * To change this template use File | Settings | File Templates.
 */
@Service
public class CommunityInfoServiceImpl implements ICommunityInfoService {

    @Autowired
    private ICommunityInfoDAO communityInfoDAO;

    public boolean saveCommunityInfo(CommunityInfo info) {
        return communityInfoDAO.saveCommunityInfo(info) > 0;
    }

    /**
     * 查询楼盘字典
     *
     * @param keys
     * @return
     */
    @Override
    public List<CommunityInfo> queryCommunity(String keys) {
        keys = keys + "%";
        return communityInfoDAO.queryCommunity(keys);
    }
}
