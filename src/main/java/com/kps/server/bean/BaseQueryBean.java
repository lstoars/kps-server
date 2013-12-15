package com.kps.server.bean;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-14
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */
public class BaseQueryBean {

    private int page;

    private int pageSize;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getStart() {
        return (page - 1) * pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this,
                ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
