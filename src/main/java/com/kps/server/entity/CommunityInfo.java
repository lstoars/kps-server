package com.kps.server.entity;

/**
 * 楼盘字典信息
 *
 * User: fei
 * Date: 13-12-28
 * Time: 下午2:29
 * To change this template use File | Settings | File Templates.
 */
public class CommunityInfo extends BaseEntity {

    private int id;

    private String name;

    private String sampleSpell;

    private String fullSpell;

    private String traffic;

    private String supports;

    private String description;

    private String status;

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

    public String getSampleSpell() {
        return sampleSpell;
    }

    public void setSampleSpell(String sampleSpell) {
        this.sampleSpell = sampleSpell;
    }

    public String getFullSpell() {
        return fullSpell;
    }

    public void setFullSpell(String fullSpell) {
        this.fullSpell = fullSpell;
    }

    public String getTraffic() {
        return traffic;
    }

    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }

    public String getSupports() {
        return supports;
    }

    public void setSupports(String supports) {
        this.supports = supports;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
