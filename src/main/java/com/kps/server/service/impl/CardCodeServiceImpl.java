package com.kps.server.service.impl;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.dao.ICardCodeDAO;
import com.kps.server.entity.CardCode;
import com.kps.server.service.ICardCodeService;
import com.kps.server.utils.CodeUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 卡密服务接口
 * User: fei
 * Date: 13-11-23
 * Time: 下午10:57
 * To change this template use File | Settings | File Templates.
 */
@Service
public class CardCodeServiceImpl implements ICardCodeService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private static long CODE_MIN = 100000000000L;
    private static long CODE_MAX = 999999999999L;

    @Autowired
    private ICardCodeDAO cardCodeDAO;

    @Override
    public BaseResultBean<Integer> generateCardCode(int count, int term, int smsCount, String saleChannel) {
        BaseResultBean<Integer> result = new BaseResultBean<Integer>();
        CardCode cardCode;
        int successCount = 0;
        for (int i = 0; i < count; i++) {
            String code = CodeUtils.getCode(CODE_MIN, CODE_MAX);
            cardCode = new CardCode();
            cardCode.setCode(code);
            cardCode.setTerm(term);
            cardCode.setSmsCount(smsCount);
            cardCode.setSaleChannel(saleChannel);

            try {
                int row = cardCodeDAO.saveCardCode(cardCode);
                if (row == 1) {
                    successCount++;
                }
            } catch (Exception e) {
                logger.error("saveCardCode error,code:" + code, e);
            }
        }
        result.setData(successCount);
        return result;
    }

    public BaseResultBean<CardCode> verfifyCode(String code, String username, String clientId) {
        BaseResultBean<CardCode> result = new BaseResultBean<CardCode>();
        CardCode cardCode = cardCodeDAO.queryByCode(code);

        //判断是否存在
        if (null == cardCode) {
            logger.warn("CardCodeServiceImpl@verfifyCode code is not exist,code:{},username:{},clientId:{}", code, username, clientId);
            result.setErrorMessage("该卡密不存在，或者已经过期！");
            return result;
        }

        //判断是否有绑定过用户，
        //1.之前么有绑定过，新增绑定
        if (StringUtils.equals("tools", clientId)) {
            if(StringUtils.isEmpty(cardCode.getUserName())) { //没有使用过
                Date now = new Date();
                cardCode.setBeginTime(now);
                cardCode.setUserName(username);
                cardCode.setClientId(clientId);
                cardCodeDAO.bindUser(cardCode);
                result.setData(cardCode);
                return result;
            }
        } else {
            if (null == cardCode.getBeginTime()
                    && StringUtils.isEmpty(cardCode.getUserName())) {
                Date now = new Date();
                cardCode.setBeginTime(now);
                Calendar cal = Calendar.getInstance();
                cal.setTime(now);
                cal.add(Calendar.DAY_OF_MONTH, cardCode.getTerm());
                cardCode.setEndTime(cal.getTime());
                cardCode.setUserName(username);
                cardCode.setClientId(clientId);
                cardCodeDAO.bindUser(cardCode);
                result.setData(cardCode);
                return result;
            }
        }

        result.setData(cardCode);

        //2.之前有绑定过，判断是否到期
        if (StringUtils.equals("tools", clientId)) {
            //判断短信的使用条数
            if (cardCode.getSmsUseCount() >= cardCode.getSmsCount()) {
                result.setErrorMessage("对不起，该卡密" + cardCode.getSmsCount() + "条短信，已经全部使用完！");
                return result;
            }
        } else {
            if (cardCode.getEndTime().before(new Date())) {
                result.setErrorMessage("对不起，该卡密已经过期！");
                return result;
            }
        }

        //3.之前有绑定过，判断用户名是否一致
        if (!StringUtils.equals(username, cardCode.getUserName())) {
            result.setErrorMessage("对不起，您输入的用户名和该卡绑定的用户不一致！");
            return result;
        }

        //4.判断clientId 是否一致
        if (!StringUtils.equals(clientId, cardCode.getClientId())) {
            result.setErrorMessage("对不起，该卡密已经在其他客户端使用过了。");
        }

        //验证成功成功返回
        return result;
    }

    /**
     * 查询手机号码 剩余的短信条数
     *
     * @param mobile 手机号码
     * @return
     */
    @Override
    public int queryOverSmsCount(String mobile) {
        List<CardCode> codes = cardCodeDAO.querySmsCodeByMobile(mobile);
        if (CollectionUtils.isEmpty(codes)) {
            return 0;
        }

        int result = 0;
        for (CardCode code : codes) {
            result += (code.getSmsCount() - code.getSmsUseCount());
        }

        return result;
    }

}
