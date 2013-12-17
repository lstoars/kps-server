package com.kps.server.service.impl;

import com.kps.server.dao.INewsInfoDAO;
import com.kps.server.dao.IThTelInfoDAO;
import com.kps.server.dao.IZxImagesDAO;
import com.kps.server.entity.NewsInfo;
import com.kps.server.entity.ThTelInfo;
import com.kps.server.entity.ZxImages;
import com.kps.server.service.IToolsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-12-7
 * Time: 下午4:58
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ToolsServiceImpl implements IToolsService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IZxImagesDAO imagesDAO;

    @Autowired
    private INewsInfoDAO newsInfoDAO;

    @Autowired
    private IThTelInfoDAO thTelInfoDAO;

    @Override
    public List<ZxImages> queryByType(int type) {
        return imagesDAO.queryByType(type);
    }

    @Override
    public List<NewsInfo> queryAllNews() {
        return newsInfoDAO.queryAllNews();
    }

    @Override
    public int saveNews(String title, String url) {
        NewsInfo info = new NewsInfo();
        info.setSortIndex(99);
        info.setTitle(title);
        info.setUrl(url);
        return newsInfoDAO.saveNews(info);
    }

    @Override
    public int updateNewsSortIndex(Map<Integer, Integer> params) {
        int count = 0;
        for (Map.Entry<Integer, Integer> entry : params.entrySet()) {
            Map<String, Integer> m = new HashMap<String, Integer>();
            m.put("id", entry.getKey());
            m.put("sortIndex", entry.getValue());
            count += newsInfoDAO.updateSortIndex(m);
        }
        return count;
    }

    @Override
    public int delNews(int id) {
        return newsInfoDAO.delNews(id);
    }

    @Override
    public int saveThTel(ThTelInfo info) {
        ThTelInfo dbInfo = thTelInfoDAO.queryByTel(info.getTel());
        if (thTelInfoDAO.queryByTel(info.getTel()) == null) {
            logger.info("save " + info);
            return thTelInfoDAO.saveThTelInfo(info);
        } else {
            info.setId(dbInfo.getId());
            logger.info("update " + info);
            return thTelInfoDAO.updateThTel(info);
        }
    }

    /**
     * 查询同行手机
     *
     * @param tel
     * @return
     */
    @Override
    public ThTelInfo queryThTel(String tel) {
        return thTelInfoDAO.queryByTel(tel);
    }
}
