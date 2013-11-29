package com.kps.server.dao;

import com.kps.server.entity.UserInfo;

import java.util.Map;

/**
 * 用户DAO
 * User: jjs
 * Date: 13-11-29
 * Time: 下午4:52
 * To change this template use File | Settings | File Templates.
 */
public interface IUserInfoDAO {

    /**
     * 添加用户
     * @param info
     * @return
     */
    public int saveUserInfo(UserInfo info);

    /**
     * 根据用户名、版本ID 查询用户
     * @param params
     * @return
     */
    public UserInfo queryByNameAndClient(Map<String,Object> params);

    /**
     * 用户续费
     * @param info
     * @return
     */
    public int recharge(UserInfo info);

    /**
     * 增加用户的短信发送条数
     * @param userId
     * @return
     */
    public int addSmsUseCount(int userId);

    /**
     * 减少用户的短信发送条数
     * @param userId
     * @return
     */
    public int reduceSmsUseCount(int userId);
}
