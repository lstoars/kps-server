package com.kps.server.service;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.UserInfo;

/**
 * 用户服务
 * User: hcf
 * Date: 13-11-29
 * Time: 下午5:18
 * To change this template use File | Settings | File Templates.
 */
public interface IUserInfoService {

    /**
     * 充值
     * @return
     */
    public BaseResultBean<UserInfo> recharge(String username,String clientId,String cardCode);

    /**
     * 查询可使用的短信条数
     * @param mobile
     * @return
     */
    public BaseResultBean<Integer> querySmsCount(String mobile);

    /**
     * 登录
     * @param username
     * @param clientId
     * @return
     */
    public BaseResultBean<UserInfo> login(String username,String clientId);

}
