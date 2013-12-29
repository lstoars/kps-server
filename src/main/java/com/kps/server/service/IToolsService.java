package com.kps.server.service;

import com.kps.server.entity.*;

import java.util.List;
import java.util.Map;

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
     *
     * @return
     */
    public List<NewsInfo> queryAllNews();

    /**
     * 保存新闻
     *
     * @return
     */
    public int saveNews(String title, String url);

    /**
     * 设置新闻排序
     *
     * @param params
     * @return
     */
    public int updateNewsSortIndex(Map<Integer, Integer> params);

    /**
     * 删除新闻
     *
     * @param id
     * @return
     */
    public int delNews(int id);

    /**
     * 保存同行电话
     *
     * @param info
     * @return
     */
    public int saveThTel(ThTelInfo info);

    /**
     * 查询同行手机
     *
     * @param tel
     * @return
     */
    public ThTelInfo queryThTel(String tel);

    /**
     * 查询同行电话历史数量信息
     *
     * @return
     */
    public ThTelHistory queryThHistory();

    /**
     * 查询公司列表
     *
     * @return
     */
    public List<CompanyInfo> queryAllCompany();
}
