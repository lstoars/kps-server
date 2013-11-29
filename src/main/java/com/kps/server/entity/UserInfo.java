package com.kps.server.entity;

import java.util.Date;

/**
 * 用户实体
 * User: jjs
 * Date: 13-11-29
 * Time: 下午4:48
 * To change this template use File | Settings | File Templates.
 */
public class UserInfo extends BaseEntity {

    private int id;

    private String username;

    private String clientId;

    private Date beginTime;

    private Date endTime;

    private int smsCount;

    private int smsUseCount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getSmsCount() {
        return smsCount;
    }

    public void setSmsCount(int smsCount) {
        this.smsCount = smsCount;
    }

    public int getSmsUseCount() {
        return smsUseCount;
    }

    public void setSmsUseCount(int smsUseCount) {
        this.smsUseCount = smsUseCount;
    }
}
