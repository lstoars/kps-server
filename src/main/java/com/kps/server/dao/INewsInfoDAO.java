package com.kps.server.dao;

import com.kps.server.entity.NewsInfo;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-12-11
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
public interface INewsInfoDAO {

    public List<NewsInfo> queryAllNews();

    public int saveNews(NewsInfo info);

    public int updateSortIndex(Map<String,Integer> params);

    public int delNews(int id);
}
