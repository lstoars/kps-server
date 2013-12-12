package com.kps.server.controls;

import com.kps.server.entity.NewsInfo;
import com.kps.server.service.ICardCodeService;
import com.kps.server.service.IToolsService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 卡密后台管理类
 * User: fei
 * Date: 13-11-27
 * Time: 下午10:49
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ICardCodeService cardCodeService;

    @Autowired
    private IToolsService toolsService;

    @RequestMapping("/add_page")
    private ModelAndView genPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/add");
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView generate(int count, int term, int smsCount, String saleChannel) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/add_success");
        mav.addObject("result", cardCodeService.generateCardCode(count, term, smsCount, saleChannel));
        return mav;
    }

    @RequestMapping("/news_list")
    public ModelAndView newsList() {
        ModelAndView result = new ModelAndView();
        List<NewsInfo> news = toolsService.queryAllNews();
        result.addObject("news", news);
        result.setViewName("admin/news_manager");
        return result;
    }

    @RequestMapping("/save_news")
    public ModelAndView saveNews(String title, String url) {
        ModelAndView view = new ModelAndView();
        if (StringUtils.isNotEmpty(title) && StringUtils.isNotEmpty(url)) {
            toolsService.saveNews(title, url);
        }
        view.setViewName("redirect:/kps/admin/news_list");
        return view;
    }

    @RequestMapping("/set_news_index")
    public ModelAndView setNewsIndex() {
        ModelAndView view = new ModelAndView();
        String[] ids = request.getParameterValues("newsid");
        Map<Integer, Integer> params = new HashMap<Integer, Integer>();
        for (String id : ids) {
            String sortIndex = request.getParameter("sort_index_" + id);
            params.put(NumberUtils.toInt(id), NumberUtils.toInt(sortIndex));
        }
        toolsService.updateNewsSortIndex(params);
        view.setViewName("redirect:/kps/admin/news_list");
        return view;
    }

    @RequestMapping("/del_news")
    public ModelAndView delNews(int id) {
        ModelAndView view = new ModelAndView();
        toolsService.delNews(id);
        view.setViewName("redirect:/kps/admin/news_list");
        return view;
    }

    @Autowired
    private HttpServletRequest request;
}
