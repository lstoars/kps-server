package com.kps.server.controls.admin;

import com.kps.server.entity.ThTelInfo;
import com.kps.server.service.IToolsService;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-17
 * Time: 下午9:45
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/getdata")
public class GetDataController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IToolsService toolsService;

    @RequestMapping("/gettf")
    public void getTfData() throws IOException {
        String url = "http://dongguan.qfang.com/tycoon/n";
        for (int i = 1; i <= 11; i++) {
            Document doc = Jsoup.connect(url + i).get();
            Element eles = doc.getElementsByTag("ul").select(".listing_cont").get(0);
            Elements es = eles.getElementsByTag("li");
            for (int j = 0; j < es.size(); j++) {
                try {
                    ThTelInfo info = new ThTelInfo();
                    info.setBranchName(StringUtils.replace(StringUtils.replace(es.get(j).select(".deinfo").select(".listLeft").get(0).getElementsByTag("dd").get(0).text(), "所在分行：", ""), "所属门店：", ""));
                    info.setCompany("世华地产");
                    info.setName(es.get(j).select(".brokerName").get(0).text());
                    info.setTel(StringUtils.replace(es.get(j).select(".brokerPhone").get(0).text(), " ", ""));
                    toolsService.saveThTel(info);
                } catch (Exception e) {
                    logger.error("error:" + es.get(j).toString(), e);
                }
            }
        }
    }

    @RequestMapping("/getzl")
    public void getzldata() throws IOException {
        for (int i = 1; i <= 300; i++) {
            String url = "http://shenzhen.zlhome.com/agent/" + i + "/0/0/";
            Document doc = Jsoup.connect(url).get();
            Elements es = doc.select(".jjrCen").get(0).children();
            for (int j = 0; j < es.size(); j++) {
                System.out.println("-----------------------------------" + i);
                try {
                    ThTelInfo info = new ThTelInfo();
                    info.setBranchName(es.get(j).select(".teh").get(0).getElementsByTag("i").get(0).getElementsByTag("a").text());
                    info.setCompany("中联地产");
                    info.setName(es.get(j).select(".img").get(0).text().replaceAll("[0-9]+", ""));
                    info.setTel(es.get(j).select(".teh").select(".orange").text());
                    toolsService.saveThTel(info);
                } catch (Exception e) {
                    logger.error("error:" + es.get(j).toString(), e);
                }
            }
        }
    }

    @RequestMapping("/getzy")
    public void getzydata() throws IOException {
        for (int i = 1; i <= 30; i++) {
            String url = "http://esf.sz.soufun.com/agenthome/-c5%bc%d2%bc%d2%cb%b3-i3"+i+"-j3100/";
            Document doc = Jsoup.connect(url).timeout(10000).get();
            Elements eles = doc.select(".agent_pic").get(0).children();
            for (int j = 0, length = eles.size(); j < length; j++) {
                System.out.println("-----------------------------------------------"+i);
                ThTelInfo info = new ThTelInfo();
                info.setHeadPic(eles.get(j).select(".pic").get(0).getElementsByTag("img").get(0).attr("src"));
                info.setName(eles.get(j).select(".house").select(".housetitle").get(0).getElementsByTag("a").text());
                info.setCompany("家家顺");
                info.setTel(eles.get(j).select(".house").select(".black").get(1).getElementsByTag("strong").text());
                toolsService.saveThTel(info);
            }
        }
    }

    public static void main(String[] args) throws IOException {
        for (int i = 2; i <= 2; i++) {
            String url = "http://esf.sz.soufun.com/agenthome/-c5%d6%d0%d4%ad%b5%d8%b2%fa-h32-i3" + i + "-j3100/";
            Document doc = Jsoup.connect(url).get();
            Elements eles = doc.select(".agent_pic").get(0).children();
            for (int j = 0, length = eles.size(); j < length; j++) {
                ThTelInfo info = new ThTelInfo();
                info.setHeadPic(eles.get(j).select(".pic").get(0).getElementsByTag("img").get(0).attr("src"));
                info.setName(eles.get(j).select(".house").select(".housetitle").get(0).getElementsByTag("a").text());
                info.setCompany("中原地产");
                info.setTel(eles.get(j).select(".house").select(".black").get(1).getElementsByTag("strong").text());
                System.out.println(info);
            }
        }
    }
}
