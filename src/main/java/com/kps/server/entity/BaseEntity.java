package com.kps.server.entity;

import com.kps.server.utils.JsonDateSerializer;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.Date;

/**
 * User: hcf
 * Date: 13-11-29
 * Time: 下午2:52
 */
public class BaseEntity {

    @JsonSerialize(using=JsonDateSerializer.class)
    private Date createTime;

    @JsonSerialize(using=JsonDateSerializer.class)
    private Date modifyTime;

    private int version;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this,
                ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
