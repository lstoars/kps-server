package com.kps.server.service.impl;

import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushUnicastMessageRequest;
import com.baidu.yun.channel.model.PushUnicastMessageResponse;
import com.kps.server.bean.BaseResultBean;
import com.kps.server.dao.ICardCodeDAO;
import com.kps.server.entity.CardCode;
import com.kps.server.entity.SmsRecord;
import com.kps.server.service.ISmsSendService;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 短信发送实现类
 * User: fei
 * Date: 13-11-28
 * Time: 下午10:32
 */
public class SmsSendServiceImpl implements ISmsSendService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //    public static String PUSH_URL = "http://channel.api.duapp.com/rest/2.0/channel/channel";
    public static String API_KEY = "3G4OmEMWhCGndddkLICcLMB9";
    public static String SECRET_KEY = "GqoGi9wxrS0ZeS92AZvgRbhGqQ20ptUG";

    @Autowired
    private ICardCodeDAO cardCodeDAO;

    /**
     * 发送短信
     *
     * @param record
     * @return
     */
    @Override
    public BaseResultBean<SmsRecord> sendSms(SmsRecord record) {
        BaseResultBean<SmsRecord> result = new BaseResultBean<SmsRecord>();
        //检查短信条数
        List<CardCode> codes = cardCodeDAO.querySmsCodeByMobile(record.getPhone());
        if (CollectionUtils.isEmpty(codes)) {
            result.setErrorMessage("发送失败，号码" + record.getPhone() + "可使用的短信条数为0.");
            return result;
        }

        //更新短信发送条数
        boolean addCountResult = false;
        int addCountCodeId = 0;
        for (CardCode code : codes) {
            addCountCodeId = code.getId();
            int count = cardCodeDAO.addSmsUseCount(addCountCodeId);
            if (count == 1) {
                addCountResult = true;
                break;
            }
        }

        if (!addCountResult) {
            result.setErrorMessage("发送失败，更新号码使用条数失败，有可能可发送条数为0.");
            return result;
        }

        //调用百度接口发送
        boolean r = doSend(record);
        if (r) {
            //发送保存发送纪录
        } else {
            //发送失败 回滚扣除的发送数量 根据addCountCodeId
        }
        return result;
    }


    private boolean doSend(SmsRecord record) {
        ChannelKeyPair pair = new ChannelKeyPair(API_KEY, SECRET_KEY);
        BaiduChannelClient channelClient = new BaiduChannelClient(pair);
        try {
            PushUnicastMessageRequest request = new PushUnicastMessageRequest();
            request.setDeviceType(3);
            request.setMessage(record.getPhone() + "|" + record.getTitle());
            // 5. 调用pushMessage接口
            PushUnicastMessageResponse response = channelClient.pushUnicastMessage(request);
            // 6. 认证推送成功
            System.out.println("push amount : " + response.getSuccessAmount());
            return response.getSuccessAmount() == 2;
        } catch (ChannelClientException e) {
            // 处理客户端错误异常
            logger.error("SmsSendServiceImpl@doSend error", e);
        } catch (ChannelServerException e) {
            logger.error(String.format("SmsSendServiceImpl@doSend error request_id: %d, error_code: %d, error_message: %s",
                    e.getRequestId(), e.getErrorCode(), e.getErrorMsg()
            ), e);
        }
        return false;
    }


    public static void main(String[] args) {

    }
}
