package com.kps.server.controls.admin;

import com.kps.server.bean.BaseQueryBean;
import com.kps.server.bean.BaseResultBean;
import com.kps.server.bean.QueryResultBean;
import com.kps.server.entity.CardCode;
import com.kps.server.service.ICardCodeService;
import org.apache.commons.lang.math.NumberUtils;
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
 * Date: 13-12-14
 * Time: 下午10:13
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/admin/card")
public class CardCodeController {

    @Autowired
    private ICardCodeService cardCodeService;

    @RequestMapping("/add_page")
    private ModelAndView genPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/add_code");
        return mav;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> generate(int count, int term, int smsCount, String saleChannel) {
        Map<String, Object> mav = new HashMap<String, Object>();
        mav.put("result", cardCodeService.generateCardCode(count, term, smsCount, saleChannel));
        return mav;
    }

    @RequestMapping("/list_page")
    public ModelAndView listPage() {
        ModelAndView view = new ModelAndView();
        view.setViewName("admin/code_list");
        return view;
    }

    @RequestMapping("/code_list")
    @ResponseBody
    public Map<String, Object> codeList(int page, int pagesize) {
        Map<String, Object> result = new HashMap<String, Object>();
        BaseQueryBean query = new BaseQueryBean();
        query.setPage(page);
        query.setPageSize(pagesize);
        QueryResultBean<CardCode> r = cardCodeService.queryCardCode(query);
        result.put("Rows", r.getDatas());
        result.put("Total", r.getTotalRecord());
        return result;
    }


}
