package com.kps.server.entity;

import java.util.Date;

/**
 * 版本
 * User: fei
 * Date: 13-11-24
 * Time: 下午9:09
 * To change this template use File | Settings | File Templates.
 */
public class VersionInfo extends BaseEntity{

    private int id;

    private String clientId;

    private String version;

    private String url;

    private String versionInfo;

    private boolean mustUpgrade;

    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getVersionInfo() {
        return versionInfo;
    }

    public void setVersionInfo(String versionInfo) {
        this.versionInfo = versionInfo;
    }

    public boolean isMustUpgrade() {
        return mustUpgrade;
    }

    public void setMustUpgrade(boolean mustUpgrade) {
        this.mustUpgrade = mustUpgrade;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
