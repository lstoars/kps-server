package com.kps.server.entity;

/**
 * 同行手机号码
 * User: fei
 * Date: 13-12-14
 * Time: 上午12:11
 */
public class ThTelInfo extends BaseEntity {

    private int id;

    private String tel;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
