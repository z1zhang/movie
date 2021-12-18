package com.Service;

import java.util.List;

import com.Entity.News;

/**
 * @author zhang
 */
public interface NewsService {
    /**
     * 通过 ISDN 查找 new
     *
     * @param ISDN
     * @return
     */
    public News selectNewById(int ISDN);

    /**
     * 查询全部新闻
     *
     * @return
     */
    public List<News> Allnews();

    /**
     * 添加新闻
     *
     * @param news
     * @return
     */
    public int addNew(News news);

    /**
     * 更新新闻
     *
     * @param news
     * @return
     */
    public int upNew(News news);

    /**
     * 通过 ISDN 删除新闻
     *
     * @param ISDN
     * @return
     */
    public int DelnewById(int ISDN);
}
