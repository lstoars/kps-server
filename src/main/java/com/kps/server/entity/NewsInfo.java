package com.kps.server.entity;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-12-11
 * Time: 下午4:44
 * To change this template use File | Settings | File Templates.
 */
public class NewsInfo extends BaseEntity{

    private int id;

    private String title;

    private String url;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
