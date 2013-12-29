package com.kps.server.controls.admin;

import com.kps.server.entity.NewsInfo;
import com.kps.server.service.ICardCodeService;
import com.kps.server.service.IFangRuKouIndexService;
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
    private IFangRuKouIndexService fangRuKouIndexService;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView view = new ModelAndView();
        view.setViewName("admin/index");
        return view;
    }

    @RequestMapping("/create_frk_index")
    public void createFIndex() {
        fangRuKouIndexService.createNewIndex();
    }

}
