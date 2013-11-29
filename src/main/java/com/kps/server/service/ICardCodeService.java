package com.kps.server.service;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.UserInfo;

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

}
