package com.kps.server.service;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.entity.SmsRecord;

/**
 * 短信发送服务类
 * User: fei
 * Date: 13-11-28
 * Time: 下午10:22
 * To change this template use File | Settings | File Templates.
 */
public interface ISmsSendService {

    /**
     * 发送短信
     *
     * @param record
     * @return
     */
    public BaseResultBean<SmsRecord> sendSms(SmsRecord record);

}
