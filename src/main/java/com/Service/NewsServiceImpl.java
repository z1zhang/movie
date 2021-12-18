package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.NewsMapper;
import com.Entity.News;

/**
 * @author zhang
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public News selectNewById(int ISDN) {
        return newsMapper.selectNewById(ISDN);
    }

    @Override
    public List<News> Allnews() {
        return newsMapper.Allnews();
    }

    @Override
    public int addNew(News news) {
        return newsMapper.addNew(news);
    }

    @Override
    public int upNew(News news) {
        return newsMapper.upNew(news);
    }

    @Override
    public int DelnewById(int ISDN) {
        return newsMapper.DelnewById(ISDN);
    }
}
