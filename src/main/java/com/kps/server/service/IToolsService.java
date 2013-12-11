package com.kps.server.service;

import com.kps.server.entity.NewsInfo;
import com.kps.server.entity.ZxImages;

import java.util.List;

/**
 * 工具箱service
 * User: hcf
 * Date: 13-12-7
 * Time: 下午4:57
 */
public interface IToolsService {

    /**
     * 根据类型查询图片
     *
     * @param type
     * @return
     */
    public List<ZxImages> queryByType(int type);

    /**
     * 查询新闻
     * @return
     */
    public List<NewsInfo> queryAllNews();
}
