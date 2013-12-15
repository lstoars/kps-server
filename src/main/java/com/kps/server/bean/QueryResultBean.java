package com.kps.server.bean;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-14
 * Time: 下午11:37
 * To change this template use File | Settings | File Templates.
 */
public class QueryResultBean<T> {

    private boolean success = true;

    private int totalRecord;

    private String errorMessage;

    private List<T> datas;

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }
}
