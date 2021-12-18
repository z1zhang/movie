package com.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Service.TypesService;
import com.Entity.Types;

/**
 * @author zhang
 */
@Controller
public class TypesController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    @Qualifier("typesServiceImpl")
    private TypesService typesService;

    @RequestMapping("/alltypes")
    public String Alltypes(Model model) {
        // String path = request.getSession().getServletContext().getRealPath("/");
        // String realPath = request.getServletContext().getRealPath("/");
        // System.out.println(path);
        // System.out.println(realPath);
        // String basePath = request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf("/"));
        // System.out.println(basePath);

        List<Types> alltypes = typesService.Alltypes();
        model.addAttribute("alltypes", alltypes);
        return "movie/MovieCategory.jsp";
    }

    @RequestMapping("/addtype")
    public String addtype(Types types) {
        System.out.println(types);
        List<Types> alltypes = typesService.Alltypes();
        for (Types alltype : alltypes) {
            if (alltype.getId().equals(types.getId())) {
                request.setAttribute("addtype", "已经存在该电影类别编号");
                return "forward:/alltypes";
            } else if (alltype.getType().equals(types.getType())) {
                request.setAttribute("addtype", "已经存在该电影类别");
                return "forward:/alltypes";
            }

        }
        int i = typesService.addtype(types);
        if (i > 0) {
            request.setAttribute("addtype", "添加成功");
            return "forward:/alltypes";
        } else {
            request.setAttribute("addtype", "添加失败");
            return "forward:/alltypes";
        }
    }

    @RequestMapping("/uptype")
    public String Updatetype(Types types) {
        List<Types> alltypes = typesService.Alltypes();
        for (Types alltype : alltypes) {
            if (alltype.getType().equals(types.getType())) {
                request.setAttribute("addtype", "已经存在该电影类别");
                System.out.println("测试");
                return "forward:/alltypes";
            } else {
                int i = typesService.Updatetype(types);
                if (i > 0) {
                    request.setAttribute("addtype", "添加成功");
                    return "forward:/alltypes";
                } else {
                    request.setAttribute("addtype", "添加失败");
                    return "forward:/alltypes";
                }
            }
        }
        // System.out.println(types);
        return "forward:/alltypes";
    }

    @RequestMapping("/deltype")
    public String Deltype(int id) {
        int i = typesService.DeletetypeById(id);
        if (i > 0) {
            request.setAttribute("addtype", "删除成功");
            return "forward:/alltypes";
        } else {
            request.setAttribute("addtype", "删除失败");
            return "forward:/alltypes";
        }
    }

}
