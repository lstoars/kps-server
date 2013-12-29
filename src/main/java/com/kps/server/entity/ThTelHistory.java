package com.kps.server.entity;

/**
 * 同行电话人数
 * User: fei
 * Date: 13-12-29
 * Time: 下午8:44
 * To change this template use File | Settings | File Templates.
 */
public class ThTelHistory extends BaseEntity {

    private int id;

    private int count;

    private String showDate;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getShowDate() {
        return showDate;
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
