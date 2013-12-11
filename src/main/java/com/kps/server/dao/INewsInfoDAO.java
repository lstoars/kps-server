package com.kps.server.dao;

import com.kps.server.entity.NewsInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-12-11
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
public interface INewsInfoDAO {

    public List<NewsInfo> queryAllNews();
}
