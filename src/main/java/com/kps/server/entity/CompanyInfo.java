package com.kps.server.entity;

/**
 * 公司信息表
 * User: fei
 * Date: 13-12-29
 * Time: 上午11:20
 * To change this template use File | Settings | File Templates.
 */
public class CompanyInfo extends BaseEntity {

    private int id;

    private String name;

    private String imgUrl;

    private String description;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
