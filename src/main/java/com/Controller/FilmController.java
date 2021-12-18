package com.Controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Service.FilmService;
import com.Service.TypesService;
import com.Entity.Film;
import com.Entity.Types;

/**
 * @author zhang
 */
@Controller
public class FilmController {

    @Autowired
    @Qualifier("filmServiceImpl")
    private FilmService filmService;

    @Autowired
    @Qualifier("typesServiceImpl")
    private TypesService typesService;

    @Autowired
    private HttpServletRequest request;

    /**
     * 修改电影
     *
     * @param model
     * @return
     */
    @RequestMapping("/modfilm")
    public String modfilms(Model model) {
        List<Film> films = filmService.AllFilm();
        List<Types> alltypes = typesService.Alltypes();
        model.addAttribute("films", films);
        model.addAttribute("alltypes", alltypes);
        return "movie/MovieUpdate.jsp";
    }

    /**
     * 预览电影
     *
     * @param model
     * @return
     */
    @RequestMapping("/allfilm")
    public String allfilms(Model model) {
        List<Film> films = filmService.AllFilm();
        model.addAttribute("allfilms", films);
        return "movie/MoviePreview.jsp";
    }

    /**
     * 删除电影
     *
     * @param ISDN
     * @return
     */
    @RequestMapping("/delfilm")
    public String delfilm(int ISDN) {
        int i = filmService.DelFilm(ISDN);
        if (i > 0) {
            request.setAttribute("films1", "删除成功");
            return "forward:/modfilm";
        } else {
            request.setAttribute("films1", "删除失败");
            return "forward:/modfilm";
        }
    }

    /**
     * 修改电影
     *
     * @param film
     * @return
     */
    @RequestMapping("/addfilm")
    public String addfilm(Film film) {
        // 1.文件根目录
        String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/") + "video/";
        File uploadDir = new File(UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        // System.out.println(film);

        // 2.如果请求包含内容
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (item.isFormField()) {
                        if ("ISDN".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setISDN(Integer.parseInt(text));
                                List<Film> films = filmService.AllFilm();
                                for (Film film1 : films) {
                                    System.out.println(film1);
                                    if (film1.getISDN() == Integer.parseInt(text)) {
                                        System.out.println("1111");
                                        request.setAttribute("films1", "电影ID已存在");
                                        return "forward:/modfilm";
                                    }
                                }
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("name".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setName(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("director".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setDirector(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("actor".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setActor(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("type".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setType(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("country".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setCountry(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("language".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setLanguage(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("score".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setScore(Double.parseDouble(text));
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                        if ("description".equals(item.getFieldName())) {
                            // 获取表单文本域数据
                            String text;
                            try {
                                text = item.getString("UTF-8");
                                film.setDescription(text);
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }

                    }
                    if (!item.isFormField()) {
                        // 3.获取选择名
                        String name = new File(item.getName()).getName();
                        String n1 = name.substring(name.lastIndexOf(".")).toLowerCase();
                        System.out.println(n1);
                        if (n1.equals(".jpg") || n1.equals(".png")) {
                            String l = request.getRequestURL().substring(0, request.getRequestURL().lastIndexOf("/"))
                                + "/video/";
                            film.setPhoto(l + File.separator + name);
                        } else if (n1.equals(".mp4")) {
                            String l = request.getRequestURL().substring(0, request.getRequestURL().lastIndexOf("/"))
                                + "/video/";
                            film.setHref(l + File.separator + name);
                        }
                        // 4.将文件写到指定位置
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("films1", "文件上传失败");
            }

        } else {

            request.setAttribute("films1", "文件上传失败");
            return "forward:/modfilm";
        }

        int i = filmService.AddFilm(film);
        if (i > 0) {

            request.setAttribute("films1", "添加成功");
            return "forward:/modfilm";
        } else {
            request.setAttribute("films1", "添加成功");
            return "forward:/modfilm";
        }

    }

    /**
     * 详情页
     *
     * @param ISDN
     * @param model
     * @return
     */
    @RequestMapping("/getDetail")
    public String getDetail(int ISDN, Model model) {
        List<Film> films = filmService.selectfilmByISDN(ISDN);
        model.addAttribute("filmDe", films);
        return "movie/MovieDetail.jsp";
    }

    /**
     * 修改电影信息
     * 
     * @param film
     * @return
     */
    @RequestMapping("/upfilm")
    public String upfilm(Film film) {
        int i = filmService.upFilm(film);
        if (i > 0) {
            request.setAttribute("films1", "修改成功");

            return "forward:/modfilm";
        } else {
            request.setAttribute("films1", "修改失败");
            return "forward:/modfilm";
        }
    }

    @RequestMapping("/sfByI")
    public String selectfilmByISDN(int ISDN, Model model) {
        List<Film> films = filmService.AllFilm();
        for (Film film : films) {
            if (film.getISDN() == ISDN) {
                List<Film> films1 = filmService.selectfilmByISDN(ISDN);
                List<Types> alltypes = typesService.Alltypes();
                model.addAttribute("films", films1);
                model.addAttribute("alltypes", alltypes);
                return "movie/MovieUpdate.jsp";
            }
        }
        request.setAttribute("films1", "电影ID不存在");
        return "forward:/modfilm";
    }

    @RequestMapping("/sfByD")
    public String selectfilmByDir(String director, Model model) {
        List<Film> films1 = filmService.selectfilmByDir("%" + director + "%");
        if (films1 != null) {
            List<Types> alltypes = typesService.Alltypes();
            model.addAttribute("films", films1);
            model.addAttribute("alltypes", alltypes);
            return "movie/MovieUpdate.jsp";
        } else {
            request.setAttribute("films1", "没有相似导演");
            return "forward:/modfilm";
        }

    }

    @RequestMapping("/sfByT")
    public String selectfilmBytype(String type, Model model) {
        List<Film> films = filmService.AllFilm();
        for (Film film : films) {
            if (film.getType().equals(type)) {
                List<Film> films1 = filmService.selectfilmBytype(type);
                List<Types> alltypes = typesService.Alltypes();
                model.addAttribute("films", films1);
                model.addAttribute("alltypes", alltypes);
                return "movie/MovieUpdate.jsp";
            }
        }
        request.setAttribute("films1", "没有对应类型的电影" + type);
        return "forward:/modfilm";
    }

    @RequestMapping("/sfByi")
    public String selectfilmByI(int ISDN, Model model) {
        List<Film> films = filmService.AllFilm();
        System.out.println(ISDN);
        for (Film film : films) {
            if (film.getISDN() == ISDN) {
                List<Film> films1 = filmService.selectfilmByISDN(ISDN);
                model.addAttribute("allfilms", films1);
                return "movie/MoviePreview.jsp";
            }
        }
        return "forward:/allfilm";
    }

}
