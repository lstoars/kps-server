package com.kps.server.entity;

/**
 * 用户反馈
 * User: fei
 * Date: 13-12-23
 * Time: 下午10:21
 * To change this template use File | Settings | File Templates.
 */
public class UserFeedBack extends BaseEntity {

    private int id;

    /**
     * 内容
     */
    private String content;

    /**
     * 联系方式
     */
    private String contact;

    /**
     * 状态
     */
    private int status;

    /**
     * 处理意见
     */
    private String dealOption;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDealOption() {
        return dealOption;
    }

    public void setDealOption(String dealOption) {
        this.dealOption = dealOption;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
