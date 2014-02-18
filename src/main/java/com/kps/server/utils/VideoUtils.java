package com.kps.server.utils;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 14-2-18
 * Time: 下午9:27
 * To change this template use File | Settings | File Templates.
 */
public class VideoUtils {

    public static final Map<String, String> urlsMap = new HashMap<String, String>();

    public static String getVideoUrl(String url) {
        if (StringUtils.contains(url, "loukoo")) {
            return getLouKooVideoUrl(url);
        } else if (StringUtils.contains(url, "56.com")) {
            return get56VideoUrl(url);
        } else if (StringUtils.contains(url, "sina.com")) {
            return getSinaVideoUrl(url);
        } else if (StringUtils.contains(url, "youku")) {
            return getYoukuUrl(url);
        } else if (StringUtils.contains(url, "sohu")) {
            return getSohuUrl(url);
        }
        return StringUtils.EMPTY;
    }

    public static void main(String[] args) {
        System.out.println(getVideoUrl("http://shenzhen.loukoo.com/204069-%E6%B7%B1%E5%9C%B3-%E7%9A%87%E5%BA%AD%E5%A8%81%E5%B0%BC%E6%96%AF%E4%BA%BA%E5%B9%BF%E5%9C%BA.aspx"));
        System.out.println(getVideoUrl("http://www.56.com/u88/v_MTA1MTk4MDA1.html"));
        System.out.println(getVideoUrl("http://video.sina.com.cn/p/ent/2014-01-20/100163414433.html"));
        System.out.println(getVideoUrl("http://v.youku.com/v_show/id_XNjA0MTc0MjM2.html"));
        System.out.println(getVideoUrl("http://tv.sohu.com/20140122/n393942373.shtml"));
    }

    public static String getSohuUrl(String url) {
        try {
            Document doc = Jsoup.connect(url).timeout(300000).get();
            String html = doc.html();
            String pattern = "content=\"(.*?)/v.swf&amp;autoplay=false";
            Pattern pat = Pattern.compile(pattern);
            Matcher matcher = pat.matcher(html);
            if (matcher.find()) {
                return matcher.group(1) + "/v.swf&autoplay=false";
            } else {
                return StringUtils.EMPTY;
            }
        } catch (Exception e) {
            return StringUtils.EMPTY;
        }
    }

    public static String getYoukuUrl(String url) {
        String pattern = "id_(.*?).html";
        Pattern pat = Pattern.compile(pattern);
        Matcher matcher = pat.matcher(url);

        String videoId = null;
        if (matcher.find()) {
            videoId = matcher.group(1);
        }

        if (StringUtils.isEmpty(videoId)) {
            return StringUtils.EMPTY;
        }

        String url_temp = "http://player.youku.com/player.php/sid/$video_id$/v.swf";

        return StringUtils.replace(url_temp, "$video_id$", videoId);
    }

    public static String getSinaVideoUrl(String url) {
        try {
            Document doc = Jsoup.connect(url).timeout(300000).get();
            String html = doc.html();
            String pattern = "swfOutsideUrl:'(.*?)'";
            Pattern pat = Pattern.compile(pattern);
            Matcher matcher = pat.matcher(html);
            if (matcher.find()) {
                return matcher.group(1);
            } else {
                return StringUtils.EMPTY;
            }
        } catch (Exception e) {
            return StringUtils.EMPTY;
        }
    }

    public static String get56VideoUrl(String url) {
        String pattern = "v_(.*?)\\.html";
        Pattern pat = Pattern.compile(pattern);
        Matcher matcher = pat.matcher(url);

        String videoId = null;
        if (matcher.find()) {
            videoId = matcher.group(1);
        }

        if (StringUtils.isEmpty(videoId)) {
            return StringUtils.EMPTY;
        }

        String url_temp = "http://player.56.com/v_$video_id$.swf";

        return StringUtils.replace(url_temp, "$video_id$", videoId);
    }

    public static String getLouKooVideoUrl(String louKooUrl) {
        /*try {
            Document doc = Jsoup.connect(louKooUrl).timeout(300000).get();
            return doc.getElementById("ContentPlaceHolderMain_txtFlashCode").attr("value");
        } catch (Exception e) {
            return StringUtils.EMPTY;
        }*/
        String pattern = "http://(.*?).loukoo.com/(.*?)-";
        Pattern pat = Pattern.compile(pattern);
        Matcher matcher = pat.matcher(louKooUrl);

        String city = null;
        String id = null;
        if (matcher.find()) {
            city = matcher.group(1);
            id = matcher.group(2);
        }
        return "http://" + city + ".loukoo.com/flash/singleplayer.swf?v=" + id + "&city=" + city;
    }

}
