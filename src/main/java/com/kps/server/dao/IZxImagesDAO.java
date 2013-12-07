package com.kps.server.dao;

import com.kps.server.entity.ZxImages;

import java.util.List;

/**
 * 装修图片
 * User: hcf
 * Date: 13-12-7
 * Time: 下午4:54
 * To change this template use File | Settings | File Templates.
 */
public interface IZxImagesDAO {

    /**
     * 根据类型查询图片
     * @param type
     * @return
     */
    public List<ZxImages> queryByType(int type);
}
