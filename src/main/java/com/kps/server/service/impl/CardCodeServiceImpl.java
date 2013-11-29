package com.kps.server.service.impl;

import com.kps.server.bean.BaseResultBean;
import com.kps.server.dao.ICardCodeDAO;
import com.kps.server.dao.IUserInfoDAO;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.UserInfo;
import com.kps.server.service.ICardCodeService;
import com.kps.server.utils.CodeUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.*;

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

}
