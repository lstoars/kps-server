package com.kps.server.dao;

import com.kps.server.entity.ThTelHistory;
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
     * @param info
     * @return
     */
    public int saveThTelInfo(ThTelInfo info);

    /**
     * 更新同行电话
     *
     * @param info
     * @return
     */
    public int updateThTel(ThTelInfo info);

    /**
     * 查询最近的电话号码数量
     *
     * @return
     */
    public ThTelHistory queryNewHistory();

    /**
     * 保存历史
     *
     * @param history
     * @return
     */
    public int saveNewHistory(ThTelHistory history);
}
