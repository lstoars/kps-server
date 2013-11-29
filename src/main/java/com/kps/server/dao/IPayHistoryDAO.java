package com.kps.server.dao;

import com.kps.server.entity.PayHistory;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-11-29
 * Time: 下午5:04
 * To change this template use File | Settings | File Templates.
 */
public interface IPayHistoryDAO {

    public int savePayHistory(PayHistory history);
}
