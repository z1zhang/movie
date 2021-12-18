package com.Service;

import java.util.List;

import com.Entity.Film;

/**
 * @author zhang
 */
public interface FilmService {

    /**
     * 电影数量
     *
     * @return
     */
    public int searchFilm();

    /**
     * 查找全部电影
     *
     * @return
     */
    public List<Film> AllFilm();

    /**
     * 通过ISDN查电影
     *
     * @param ISDN
     * @return
     */
    public List<Film> selectfilmByISDN(int ISDN);

    /**
     * 通过导演查电影
     *
     * @param director
     * @return
     */
    public List<Film> selectfilmByDir(String director);

    /**
     * 通过类型查电影
     *
     * @param type
     * @return
     */
    public List<Film> selectfilmBytype(String type);

    /**
     * 添加电影
     *
     * @param film
     * @return
     */
    public int AddFilm(Film film);

    /**
     * 修改电影
     *
     * @param film
     * @return
     */
    public int upFilm(Film film);

    /**
     * 通过ISDN 删除电影
     *
     * @param ISDN
     * @return
     */
    public int DelFilm(int ISDN);
}
