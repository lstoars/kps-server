package com.kps.server.controls;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 短信发送
 * User: fei
 * Date: 13-11-28
 * Time: 下午8:48
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/sms")
public class SmsController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public static final String RANDOMCODEKEY = "RANDOMVALIDATECODEKEY";//放到session中的key

    /**
     * 短信发送页面
     *
     * @param refer
     * @param phone
     * @return
     */
    @RequestMapping("/page")
    public ModelAndView sendPage(@RequestHeader(value = "referer") String refer,
                                 String phone) {
        logger.info("SmsController@sendPage refer:{},phone:{}");
        ModelAndView view = new ModelAndView();
        String title = HttpUtils.getTitle(refer);
        view.addObject("title", title);
        view.addObject("phone", phone);
        view.addObject("refer", refer);
        view.setViewName("tools/sms_send");
        return view;
    }

    /**
     * 发送短信
     *
     * @param session
     * @param phone
     * @param authCode
     * @return
     */
    @RequestMapping("/send")
    @ResponseBody
    public Map<String, Object> send(HttpSession session, String phone, String authCode, String title, String refer) {
        String randCode = (String) session.getAttribute(RANDOMCODEKEY);
        session.removeAttribute(RANDOMCODEKEY);
        Map<String, Object> result = new HashMap<String, Object>();
        if (!StringUtils.equals(authCode, randCode)) {
            result.put("success", false);
            result.put("message", "验证码错误！");
            return result;
        }



        return null;
    }

    @RequestMapping("/verfiyImg")
    public void verfiyImg(HttpServletRequest request, HttpServletResponse response) {
        RandomValidateCode validateCode = new RandomValidateCode();
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        validateCode.getRandcode(request, response);
    }


    class RandomValidateCode {
        private Random random = new Random();
        private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";//随机产生的字符串

        private int width = 80;//图片宽
        private int height = 26;//图片高
        private int lineSize = 40;//干扰线数量
        private int stringNum = 4;//随机产生字符数量

        /*
         * 获得字体
         */
        private Font getFont() {
            return new Font("Fixedsys", Font.CENTER_BASELINE, 18);
        }

        /*
         * 获得颜色
         */
        private Color getRandColor(int fc, int bc) {
            if (fc > 255)
                fc = 255;
            if (bc > 255)
                bc = 255;
            int r = fc + random.nextInt(bc - fc - 16);
            int g = fc + random.nextInt(bc - fc - 14);
            int b = fc + random.nextInt(bc - fc - 18);
            return new Color(r, g, b);
        }

        /**
         * 生成随机图片
         */
        public void getRandcode(HttpServletRequest request,
                                HttpServletResponse response) {
            HttpSession session = request.getSession();
            //BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
            Graphics g = image.getGraphics();//产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
            g.fillRect(0, 0, width, height);
            g.setFont(new Font("Times New Roman", Font.ROMAN_BASELINE, 18));
            g.setColor(getRandColor(110, 133));
            //绘制干扰线
            for (int i = 0; i <= lineSize; i++) {
                drowLine(g);
            }
            //绘制随机字符
            String randomString = "";
            for (int i = 1; i <= stringNum; i++) {
                randomString = drowString(g, randomString, i);
            }
            session.removeAttribute(RANDOMCODEKEY);
            session.setAttribute(RANDOMCODEKEY, randomString);
            g.dispose();
            try {
                ImageIO.write(image, "JPEG", response.getOutputStream());//将内存中的图片通过流动形式输出到客户端
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /*
         * 绘制字符串
         */
        private String drowString(Graphics g, String randomString, int i) {
            g.setFont(getFont());
            g.setColor(new Color(random.nextInt(101), random.nextInt(111), random.nextInt(121)));
            String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
            randomString += rand;
            g.translate(random.nextInt(3), random.nextInt(3));
            g.drawString(rand, 13 * i, 16);
            return randomString;
        }

        /*
         * 绘制干扰线
         */
        private void drowLine(Graphics g) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(13);
            int yl = random.nextInt(15);
            g.drawLine(x, y, x + xl, y + yl);
        }

        /*
         * 获取随机的字符
         */
        public String getRandomString(int num) {
            return String.valueOf(randString.charAt(num));
        }
    }
}