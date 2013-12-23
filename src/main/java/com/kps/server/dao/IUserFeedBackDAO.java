package com.kps.server.dao;

import com.kps.server.bean.BaseQueryBean;
import com.kps.server.entity.UserFeedBack;

import java.util.List;
import java.util.Map;

/**
 * 用户反馈
 * User: fei
 * Date: 13-12-23
 * Time: 下午10:23
 * To change this template use File | Settings | File Templates.
 */
public interface IUserFeedBackDAO {

    public int saveUserFeedBack(UserFeedBack feedBack);

    public int countUserFeedBack(BaseQueryBean query);

    public List<UserFeedBack> queryUserFeedBack(BaseQueryBean query);

    public int updateFeedStatus(Map<String, Object> params);


}
