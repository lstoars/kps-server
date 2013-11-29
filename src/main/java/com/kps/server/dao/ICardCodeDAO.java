package com.kps.server.dao;


import com.kps.server.entity.CardCode;

import java.util.List;
import java.util.Map;

/**
 * 卡密DAO接口
 * User: fei
 * Date: 13-11-23
 * Time: 下午10:49
 * To change this template use File | Settings | File Templates.
 */
public interface ICardCodeDAO {

    /**
     * 保存卡密
     *
     * @param code
     * @return
     */
    public int saveCardCode(CardCode code);

    /**
     * 根据卡密查询
     *
     * @param code
     * @return
     */
    public CardCode queryByCode(String code);

    /**
     * 使用卡密
     * @param id
     * @return
     */
    public int useCardCode(int id);
}
