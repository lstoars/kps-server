package com.kps.server.entity;

import java.util.Date;

/**
 * 短信发送纪录
 * User: fei
 * Date: 13-11-28
 * Time: 下午10:24
 * To change this template use File | Settings | File Templates.
 */
public class SmsRecord {

    private int id;

    private String phone;

    private String title;

    private String refer;

    private String customerPhone;

    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRefer() {
        return refer;
    }

    public void setRefer(String refer) {
        this.refer = refer;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
