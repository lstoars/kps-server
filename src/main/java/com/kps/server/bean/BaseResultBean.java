package com.kps.server.bean;

/**
 * 操作结果，基类
 * User: fei
 * Date: 13-11-23
 * Time: 下午11:57
 * To change this template use File | Settings | File Templates.
 */
public class BaseResultBean<T> {

    private boolean success = true;

    private T data;

    private String errorMessage;

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
        this.setSuccess(false);
        this.errorMessage = errorMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
