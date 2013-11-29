package com.kps.server.entity;


import java.util.Date;

/**
 * 卡密实体
 * User: fei
 * Date: 13-11-23
 * Time: 下午10:41
 */
public class CardCode extends BaseEntity{

    private int id;

    /**
     * 卡密号码
     */
    private String code;

    /**
     * 使用周期
     */
    private int term;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 使用开始时间
     */
    private Date beginTime;

    /**
     * 使用结束时间
     */
    private Date endTime;

    /**
     *  绑定用户名
     */
    private String userName;

    /**
     * 客户端ID
     */
    private String clientId;

    /**
     * 销售渠道
     */
    private String saleChannel;

    /**
     *  可发短信条件
     */
    private int smsCount;

    /**
     * 已发短信条数
     */
    private int smsUseCount;

    /**
     * 扩展属性
     */
    private String features;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getSaleChannel() {
        return saleChannel;
    }

    public void setSaleChannel(String saleChannel) {
        this.saleChannel = saleChannel;
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

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }
}
