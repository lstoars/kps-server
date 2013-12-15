package com.kps.server.entity;


import com.kps.server.utils.JsonDateSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.Date;

/**
 * 卡密实体
 * User: fei
 * Date: 13-11-23
 * Time: 下午10:41
 */
public class CardCode extends BaseEntity {

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
     * 销售渠道
     */
    private String saleChannel;

    /**
     * 状态 0：初始，1：已经使用
     */
    private int status;

    /**
     *  可发短信条件
     */
    private int smsCount;

    /**
     * 使用时间
     */
    @JsonSerialize(using = JsonDateSerializer.class)
    private Date useTime;

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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getUseTime() {
        return useTime;
    }

    public void setUseTime(Date useTime) {
        this.useTime = useTime;
    }
}

