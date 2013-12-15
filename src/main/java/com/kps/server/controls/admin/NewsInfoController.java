package com.kps.server.controls.admin;

import com.kps.server.entity.NewsInfo;
import com.kps.server.service.IToolsService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-15
 * Time: 下午10:32
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/admin/news")
public class NewsInfoController {

    @Autowired
    private IToolsService toolsService;

    @RequestMapping("/list_page")
    public ModelAndView listPage() {
        ModelAndView view = new ModelAndView();
        view.setViewName("admin/news_list");
        return view;
    }

    @RequestMapping("/news_list")
    @ResponseBody
    public Map<String, Object> newsList() {
        Map<String, Object> result = new HashMap<String, Object>();
        List<NewsInfo> news = toolsService.queryAllNews();
        result.put("Rows", news);
        result.put("Total", news.size());
        return result;
    }

    @RequestMapping("/save_news")
    public ModelAndView saveNews(String title, String url) {
        ModelAndView view = new ModelAndView();
        if (StringUtils.isNotEmpty(title) && StringUtils.isNotEmpty(url)) {
            toolsService.saveNews(title, url);
        }
        view.setViewName("redirect:/kps/admin/news/list_page");
        return view;
    }

    @RequestMapping("/update_sort_index")
    @ResponseBody
    public Map<String, Object> updateSortIndex(int id, int sortIndex) {
        Map<Integer, Integer> params = new HashMap<Integer, Integer>();
        params.put(id, sortIndex);
        int count = toolsService.updateNewsSortIndex(params);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", count > 0);
        return result;
    }

    @RequestMapping("/del_news")
    public ModelAndView delNews(int id) {
        ModelAndView view = new ModelAndView();
        toolsService.delNews(id);
        view.setViewName("redirect:/kps/admin/news/list_page");
        return view;
    }
}
