package com.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Service.NewsService;
import com.Entity.News;

/**
 * @author zhang
 */
@Controller
public class NewsController {

    @Autowired
    @Qualifier("newsServiceImpl")
    private NewsService newsService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/allnews")
    public String Allnews(Model model) {
        List<News> allnews = newsService.Allnews();
        model.addAttribute("allnews", allnews);
        return "/news/NewsDetail.jsp";
    }

    @RequestMapping("/addnew")
    public String addnew(News news) {
        List<News> allnews = newsService.Allnews();
        for (News allnew : allnews) {
            if (allnew.getISDN().equals(news.getISDN())) {
                request.setAttribute("addnew", "已经有该新闻编号");
                return "/news/NewsAdd.jsp";
            } else {
                int i = newsService.addNew(news);
                if (i > 0) {
                    request.setAttribute("addnew", "上传成功");
                    return "/news/NewsAdd.jsp";
                } else {
                    request.setAttribute("addnew", "上传失败");
                    return "/news/NewsAdd.jsp";
                }
            }

        }
        return "/news/NewsAdd.jsp";
    }

    @RequestMapping("/snew")
    public String snewById(int ISDN, Model model) {
        List<News> allnews = newsService.Allnews();
        for (News allnew : allnews) {
            if (allnew.getISDN().equals(ISDN)) {
                News news = newsService.selectNewById(ISDN);
                List<News> one = new ArrayList<News>();
                one.add(news);
                model.addAttribute("allnews", one);
                return "/news/NewsDetail.jsp";
            }
        }
        request.setAttribute("newsc", "没有该新闻编号");
        model.addAttribute("allnews", allnews);
        return "/news/NewsDetail.jsp";
    }

    @RequestMapping("/upNew")
    public String upNew(News news, String date1) {

        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
            news.setDate(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int i = newsService.upNew(news);
        if (i > 0) {
            request.setAttribute("newsc", "更新成功");
            return "forward:/allnews";
        } else {
            request.setAttribute("newsc", "更新失败");
            return "forward:/allnews";
        }
    }

    @RequestMapping("/delnew")
    public String delnew(int ISDN) {

        int i = newsService.DelnewById(ISDN);
        if (i > 0) {
            request.setAttribute("newsc", "删除成功");
            return "forward:/allnews";
        } else {
            request.setAttribute("newsc", "删除失败");
            return "forward:/allnews";
        }

    }

}
