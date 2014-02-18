package com.kps.server.service.impl;

import com.kps.server.service.IFangRuKouIndexService;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.lang.time.DateFormatUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.*;
import java.util.*;

/**
 * User: hcf
 * Date: 13-12-25
 * Time: 下午2:52
 * To change this template use File | Settings | File Templates.
 */
@Service
public class FangRuKouIndexServiceImpl implements IFangRuKouIndexService {

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Override
    public boolean createNewIndex() {
        try {
            createFile();
//            FileWriter fileWriter = new FileWriter("/Volumes/data/workspace/index.html", false);
//            System.out.println(html);
//            fileWriter.write(html);
//            fileWriter.flush();
//            fileWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private void createFile() throws IOException, TemplateException {
        Map map = new HashMap();
        //二手房成交信息
        Document esfDoc = Jsoup.connect("http://ris.szpl.gov.cn/credit/showcjgs/esfcjgs.aspx").timeout(200000).get();
        Elements esInfo = esfDoc.getElementById("TrClientList1").getElementsByTag("tr");
        Element e = esInfo.get(esInfo.size() - 1);
        String esCjArea = e.getElementsByTag("td").get(1).text();
        String esCjCount = e.getElementsByTag("td").get(2).text();
        map.put("esCjArea", esCjArea);
        map.put("esCjCount", esCjCount);
        Document esfCjTopDoc = Jsoup.connect("http://ris.szpl.gov.cn/credit/showcjgs/esfTop10.aspx").timeout(200000).get();
        Elements top10s = esfCjTopDoc.select(".top10").get(0).getElementsByTag("tr");
        List<Object[]> esfTop10 = new ArrayList<Object[]>();
        for (int i = 2, length = top10s.size() - 1; i < length; i++) {
            String company = top10s.get(i).child(0).text();
            String count = top10s.get(i).child(1).text();
            String area = top10s.get(i).child(2).text();
            esfTop10.add(new String[]{company, count, area});
        }
        map.put("esfTop10", esfTop10);

        //新房成交信息
        Document xfDoc = Jsoup.connect("http://ris.szpl.gov.cn/credit/showcjgs/ysfcjgs.aspx?cjType=0").timeout(200000).get();
        Elements xfInfo = xfDoc.getElementById("TrClientList1").getElementsByTag("tr");
        Element xfe = xfInfo.get(xfInfo.size() - 1);
        String xfCjCount = xfe.getElementsByTag("td").get(1).text();
        String xfCjArea = xfe.getElementsByTag("td").get(2).text();
        String xfSyCount = xfe.getElementsByTag("td").get(3).text();
        String xfSyArea = xfe.getElementsByTag("td").get(4).text();
        map.put("xfCjCount", xfCjCount);
        map.put("xfCjArea", xfCjArea);
        map.put("xfSyCount", xfSyCount);
        map.put("xfSyArea", xfSyArea);

        List<Object[]> xfTop10 = new ArrayList<Object[]>();
        try {
            Document xfTopDoc = Jsoup.connect("http://ris.szpl.gov.cn/credit/showcjgs/Top10.aspx").timeout(200000).get();
            Elements xfTop10s = xfTopDoc.select(".top10").get(0).getElementsByTag("tr");
            for (int i = 2, length = xfTop10s.size(); i < length; i++) {
                String lp = xfTop10s.get(i).child(0).text();
                String count = xfTop10s.get(i).child(1).text();
                String area = xfTop10s.get(i).child(2).text();
                xfTop10.add(new String[]{lp, count, area});
            }
        }catch(Exception ex) {
            try  {
                Document xfTopDoc = Jsoup.connect("http://news.szhome.com/housesales_overview.aspx?type=1&area=0").timeout(200000).get();
                Elements xfTop10s = xfTopDoc.getElementsByTag("table").get(1).getElementsByTag("tr");
                for(int i=1;i<xfTop10s.size();i++) {
                    String lp = xfTop10s.get(i).child(0).text();
                    String count = xfTop10s.get(i).child(1).text();
                    String area = xfTop10s.get(i).child(2).text();
                    xfTop10.add(new String[]{lp, count, area});
                }
            }catch(Exception ex1){}
        }
        map.put("xfTop10", xfTop10);

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1);
        map.put("today", DateFormatUtils.format(cal.getTime(), "yyyy-MM-dd"));
        Template tpl = freeMarkerConfigurer.getConfiguration().getTemplate("index.ftl");
        File htmlFile = new File("/home/frk/web/index.html");
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "UTF-8"));
        tpl.process(map, out);
        out.flush();
    }

    public static void main(String[] args) throws IOException, TemplateException {
        new FangRuKouIndexServiceImpl().createFile();
    }
}
