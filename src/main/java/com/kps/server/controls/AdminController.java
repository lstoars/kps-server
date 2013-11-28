package com.kps.server.controls;

import com.kps.server.service.ICardCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("/add_page")
    private ModelAndView genPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/add");
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView generate(int count, int term, int smsCount, String saleChannel) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/add_success");     //设置返回的文件名
        mav.addObject("result", cardCodeService.generateCardCode(count, term, smsCount, saleChannel));
        return mav;
    }
}
