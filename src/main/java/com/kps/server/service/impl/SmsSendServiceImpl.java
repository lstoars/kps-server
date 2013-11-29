package com.kps.server.service.impl;

import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushUnicastMessageRequest;
import com.baidu.yun.channel.model.PushUnicastMessageResponse;
import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.kps.server.bean.BaseResultBean;
import com.kps.server.constant.ClientIdConstant;
import com.kps.server.dao.ISmsRecordDAO;
import com.kps.server.dao.IUserInfoDAO;
import com.kps.server.entity.SmsRecord;
import com.kps.server.entity.UserInfo;
import com.kps.server.service.ISmsSendService;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 短信发送实现类
 * User: fei
 * Date: 13-11-28
 * Time: 下午10:32
 */
@Service
public class SmsSendServiceImpl implements ISmsSendService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public static String API_KEY = "3G4OmEMWhCGndddkLICcLMB9";
    public static String SECRET_KEY = "GqoGi9wxrS0ZeS92AZvgRbhGqQ20ptUG";

    @Autowired
    private ISmsRecordDAO smsRecordDAO;

    @Autowired
    private IUserInfoDAO userInfoDAO;

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
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("username",record.getPhone());
        params.put("clientId", ClientIdConstant.TOOLS);
        UserInfo info = userInfoDAO.queryByNameAndClient(params);
        if(info == null || info.getSmsUseCount()>=info.getSmsCount()) {
            result.setErrorMessage("发送失败，号码" + record.getPhone() + "可使用的短信条数为0.");
            return result;
        }

        int count = userInfoDAO.addSmsUseCount(info.getId());

        if (count != 1) {
            result.setErrorMessage("发送失败，更新号码使用条数失败，有可能可发送条数为0.");
            return result;
        }

        //调用百度接口发送
        boolean r = doSend(record);
        if (r) {
            //发送保存发送纪录
            int row = smsRecordDAO.saveSmsRecord(record);
            result.setData(record);
            logger.warn("SmsSendServiceImpl@sendSms saveSmsRecord row:{},user:{},record:{}", row, info,record);
        } else {
            //发送失败 回滚扣除的发送数量
            int row = userInfoDAO.reduceSmsUseCount(info.getId());
            logger.warn("SmsSendServiceImpl@sendSms reduceSmsUseCount row:{},user:{},record:{}", row, info,record);
            result.setErrorMessage("短信发送失败！");
        }
        return result;
    }

    /**
     * 发送
     * 10:32中惠香樟绿洲二手房出售,三室两厅两卫客户感兴趣，请马上回电13944993987
     *
     * @param record
     * @return
     */
    private boolean doSend(SmsRecord record) {
        ChannelKeyPair pair = new ChannelKeyPair(API_KEY, SECRET_KEY);
        BaiduChannelClient channelClient = new BaiduChannelClient(pair);

        channelClient.setChannelLogHandler(new YunLogHandler() {
            @Override
            public void onHandle(YunLogEvent event) {
                logger.info("SmsSendServiceImpl@doSend handle,message:{}",event.getMessage());
            }
        });

        try {
            PushUnicastMessageRequest request = new PushUnicastMessageRequest();
            request.setDeviceType(3);
            request.setMessage(record.getPhone() + "|"+ DateFormatUtils.format(new Date(),"HH:mm") + record.getTitle()+"客户感兴趣，请马上回电"+record.getCustomerPhone());
            // 5. 调用pushMessage接口
            PushUnicastMessageResponse response = channelClient.pushUnicastMessage(request);
            // 6. 认证推送成功
            logger.info("SmsSendServiceImpl@doSend success,amount:{},record:{}", response.getSuccessAmount(), record);
            return response.getSuccessAmount() > 0;
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
