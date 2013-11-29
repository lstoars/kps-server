package com.kps.server.entity;

/**
 * 续费历史
 * User: hcf
 * Date: 13-11-29
 * Time: 下午5:02
 * To change this template use File | Settings | File Templates.
 */
public class PayHistory extends BaseEntity {

    private int id;

    private int userId;

    private int codeId;

    private int type;

    private String oldValue;

    private int incValue;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCodeId() {
        return codeId;
    }

    public void setCodeId(int codeId) {
        this.codeId = codeId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public int getIncValue() {
        return incValue;
    }

    public void setIncValue(int incValue) {
        this.incValue = incValue;
    }
}
