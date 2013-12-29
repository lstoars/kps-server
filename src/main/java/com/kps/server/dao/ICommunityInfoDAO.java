package com.kps.server.dao;

import com.kps.server.entity.CommunityInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * <p/>
 * User: fei
 * Date: 13-12-28
 * Time: 下午2:54
 * To change this template use File | Settings | File Templates.
 */
public interface ICommunityInfoDAO {

    public int saveCommunityInfo(CommunityInfo info);

    public List<CommunityInfo> queryCommunity(String keys);
}
