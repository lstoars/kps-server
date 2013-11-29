package com.kps.server.utils;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * User: fei
 * Date: 13-11-28
 * Time: 下午9:04
 * To change this template use File | Settings | File Templates.
 */
public class HttpUtils {

    private static Logger logger = LoggerFactory.getLogger(HttpUtils.class);

    public static String getTitle(String url) {
        Document doc;
        try {
            doc = Jsoup.connect(url).get();
            String title = doc.getElementsByTag("title").text();
            String[] titles = StringUtils.split(title,",");
            if(titles.length > 2) {
                return titles[0]+titles[1];
            } else {
                if(StringUtils.length(title) > 40) {
                    return title.substring(0,39);
                } else {
                    return title;
                }
            }
        } catch (IOException e) {
            logger.error("HttpUtils@getTitle error", e);
        }
        return StringUtils.EMPTY;
    }

    public static void main(String[] args) {
        System.out.println(getTitle("http://esf.sz.soufun.com/chushou/3_35640658.htm"));
    }
}
