package com.kps.server.service.impl;

import com.kps.server.dao.*;
import com.kps.server.entity.*;
import com.kps.server.service.IToolsService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    @Autowired
    private ICompanyInfoDAO companyInfoDAO;

    @Autowired
    private IUserFeedBackDAO userFeedBackDAO;

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
           /* info.setId(dbInfo.getId());
            logger.info("update " + info);
            return thTelInfoDAO.updateThTel(info);*/
            logger.info("is exists " + info);
            return 1;
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

    /**
     * 查询同行电话历史数量信息
     *
     * @return
     */
    @Override
    public ThTelHistory queryThHistory() {
        ThTelHistory history = thTelInfoDAO.queryNewHistory();
        if (StringUtils.equals(history.getShowDate(),
                DateFormatUtils.format(new Date(), "yyyy-MM-dd"))) {
            return history;
        }

        history.setId(0);
        history.setStatus(1);
        history.setCount(history.getCount() + new Random().nextInt(99));
        history.setShowDate(DateFormatUtils.format(new Date(), "yyyy-MM-dd"));
        history.setCreateTime(new Date());
        history.setModifyTime(new Date());
        thTelInfoDAO.saveNewHistory(history);
        return history;
    }

    /**
     * 查询公司列表
     *
     * @return
     */
    @Override
    public List<CompanyInfo> queryAllCompany() {
        return companyInfoDAO.queryAllCompany();
    }

    /**
     * 添加反馈意见
     *
     * @param type
     * @param content
     * @return
     */
    @Override
    public boolean saveUserFeed(int type, String content) {
        UserFeedBack feed = new UserFeedBack();
        feed.setContent(content);
        feed.setType(type);
        //发送邮件
        return userFeedBackDAO.saveUserFeedBack(feed) > 0;
    }
}
