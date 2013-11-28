package com.kps.server.utils;

import java.util.Random;

/**
 * 卡工具类
 * User: fei
 * Date: 13-11-24
 * Time: 上午12:12
 * To change this template use File | Settings | File Templates.
 */
public class CodeUtils {

    /**
     * 产生随机数
     *
     * @param min 随机数最小值
     * @param max 随机数最大值
     * @return
     */
    public static String getCode(final long min, final long max) {
        Random rand = new Random();
        int tmp = Math.abs(rand.nextInt());
        return String.valueOf(tmp % (max - min + 1) + min);
    }
}
