package com.kps.server.service.impl;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.constant.ClientIdConstant;
import com.kps.server.dao.ICardCodeDAO;
import com.kps.server.dao.IPayHistoryDAO;
import com.kps.server.dao.IUserInfoDAO;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.PayHistory;
import com.kps.server.entity.UserInfo;
import com.kps.server.service.IUserInfoService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户服务类
 * User: hcf
 * Date: 13-11-29
 * Time: 下午5:19
 */
@Service
public class UserInfoServiceImpl implements IUserInfoService {

    @Override
    public BaseResultBean<UserInfo> recharge(String username, String clientId, String code) {
        BaseResultBean<UserInfo> result = new BaseResultBean<UserInfo>();
        CardCode cardCode = cardCodeDAO.queryByCode(code);

        //判断是否存在
        if (null == cardCode) {
            logger.warn("UserInfoServiceImpl@recharge code is not exist,code:{},username:{},clientId:{}", code, username, clientId);
            result.setErrorMessage("该卡密不存在，或者已经使用！");
            return result;
        }

        if (cardCode.getStatus() != 0) {
            result.setErrorMessage("该卡密不存在，或者已经使用！");
            return result;
        }


        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", username);
        params.put("clientId", clientId);
        UserInfo info = userInfoDAO.queryByNameAndClient(params);

        PayHistory history = new PayHistory();
        //修改、保存用户信息
        if (info != null) {
            if (StringUtils.equals(ClientIdConstant.TOOLS, clientId)) {
                info.setSmsCount(info.getSmsCount() + cardCode.getSmsCount());

                history.setType(1);
                history.setOldValue(String.valueOf(info.getSmsCount()));
                history.setIncValue(cardCode.getSmsCount());
            } else {
                Date endTime = info.getEndTime();
                Calendar cal = Calendar.getInstance();
                cal.setTime(endTime);
                cal.add(Calendar.DAY_OF_MONTH, cardCode.getTerm());
                info.setEndTime(cal.getTime());

                history.setType(2);
                history.setIncValue(cardCode.getTerm());
                history.setOldValue(DateFormatUtils.format(endTime, "yyyy-MM-dd"));
            }
            userInfoDAO.recharge(info);
        } else {
            info = new UserInfo();
            info.setUsername(username);
            info.setClientId(clientId);
            if (StringUtils.equals(ClientIdConstant.TOOLS, clientId)) {
                info.setSmsCount(cardCode.getSmsCount());

                history.setOldValue("");
                history.setType(1);
                history.setIncValue(cardCode.getSmsCount());
            } else {
                Calendar cal = Calendar.getInstance();
                cal.setTime(new Date());
                cal.add(Calendar.DAY_OF_MONTH, cardCode.getTerm());
                info.setBeginTime(new Date());
                info.setEndTime(cal.getTime());

                history.setOldValue("");
                history.setType(2);
                history.setIncValue(cardCode.getTerm());
            }
            userInfoDAO.saveUserInfo(info);
        }
        history.setUserId(info.getId());
        history.setCodeId(cardCode.getId());

        //添加续费历史
        payHistoryDAO.savePayHistory(history);

        //修改卡密状态
        cardCodeDAO.useCardCode(cardCode.getId());
        result.setData(info);

        return result;
    }

    @Override
    public BaseResultBean<Integer> querySmsCount(String mobile) {
        BaseResultBean<Integer> result = new BaseResultBean<Integer>();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", mobile);
        params.put("clientId", ClientIdConstant.TOOLS);
        UserInfo info = userInfoDAO.queryByNameAndClient(params);
        result.setData(info == null ? 0 : info.getSmsCount() - info.getSmsUseCount());
        return result;
    }

    @Override
    public BaseResultBean<UserInfo> login(String username, String clientId) {
        BaseResultBean<UserInfo> result = new BaseResultBean<UserInfo>();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("username", username);
        params.put("clientId", clientId);
        UserInfo info = userInfoDAO.queryByNameAndClient(params);
        if (info == null) {
            result.setErrorMessage("用户不存在！");
        }
        result.setData(info);
        return result;
    }


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ICardCodeDAO cardCodeDAO;

    @Autowired
    private IUserInfoDAO userInfoDAO;

    @Autowired
    private IPayHistoryDAO payHistoryDAO;

}
