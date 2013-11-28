package com.kps.server.service;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.CardCode;

/**
 * 卡密service
 * User: fei
 * Date: 13-11-23
 * Time: 下午10:57
 * To change this template use File | Settings | File Templates.
 */
public interface ICardCodeService {

    /**
     * 生成指定张数的卡密
     *
     * @param count 张数
     * @return 操作结果，data 为成功生成张数
     */
    public BaseResultBean<Integer> generateCardCode(int count, int term, int smsCount, String saleChannel);

    /**
     * 根据卡密号码查询
     *
     * @param code
     * @return
     */
    public BaseResultBean<CardCode> verfifyCode(String code, String username, String clientId);

    /**
     * 查询手机号码 剩余的短信条数
     *
     * @param mobile
     * @return
     */
    public int queryOverSmsCount(String mobile);
}
