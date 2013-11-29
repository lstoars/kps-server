package com.kps.server.dao;

import com.kps.server.entity.SmsRecord;

/**
 * 短信发送历史
 * User: hcf
 * Date: 13-11-29
 * Time: 上午8:55
 */
public interface ISmsRecordDAO {

    /**
     * 保存短信发送记录
     * @param record
     * @return
     */
    public int saveSmsRecord(SmsRecord record);
}
