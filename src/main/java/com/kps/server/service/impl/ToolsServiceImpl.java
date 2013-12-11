package com.kps.server.service.impl;

import com.kps.server.dao.INewsInfoDAO;
import com.kps.server.dao.IZxImagesDAO;
import com.kps.server.entity.NewsInfo;
import com.kps.server.entity.ZxImages;
import com.kps.server.service.IToolsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jjs
 * Date: 13-12-7
 * Time: 下午4:58
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ToolsServiceImpl implements IToolsService {

    @Autowired
    private IZxImagesDAO imagesDAO;

    @Autowired
    private INewsInfoDAO newsInfoDAO;

    @Override
    public List<ZxImages> queryByType(int type) {
        return imagesDAO.queryByType(type);
    }

    @Override
    public List<NewsInfo> queryAllNews() {
        return newsInfoDAO.queryAllNews();
    }
}
