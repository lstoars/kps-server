package com.kps.server.service.impl;

import com.kps.server.service.IFangRuKouIndexService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * User: hcf
 * Date: 13-12-25
 * Time: 下午2:52
 * To change this template use File | Settings | File Templates.
 */
@Service
public class FangRuKouIndexServiceImpl implements IFangRuKouIndexService{

    @Override
    @Scheduled(cron="0 0 */1 * * *")
    public boolean createNewIndex() {
        return false;
    }
}
