package com.kps.server.dao;

import com.kps.server.entity.ThTelInfo;

/**
 * 同行电话查询
 * User: fei
 * Date: 13-12-14
 * Time: 上午12:12
 * To change this template use File | Settings | File Templates.
 */
public interface IThTelInfoDAO {

    /**
     * 根据手机号码查询
     *
     * @param tel
     * @return
     */
    public ThTelInfo queryByTel(String tel);

    /**
     * 保存同行电话
     *
     * @param tel
     * @return
     */
    public int saveThTelInfo(String tel);
}
