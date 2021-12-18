package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.FilmMapper;
import com.Entity.Film;

/**
 * @author zhang
 */
@Service
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmMapper filmMapper;

    @Override
    public int searchFilm(){
        return filmMapper.searchFilm();
    }

    @Override
    public List<Film> AllFilm() {
        return filmMapper.AllFilm();
    }

    @Override
    public List<Film> selectfilmByISDN(int ISDN) {
        return filmMapper.selectfilmByISDN(ISDN);
    }

    @Override
    public List<Film> selectfilmByDir(String director) {
        return filmMapper.selectfilmByDir(director);
    }

    @Override
    public List<Film> selectfilmBytype(String type) {
        return filmMapper.selectfilmBytype(type);
    }

    @Override
    public int AddFilm(Film film) {
        return filmMapper.AddFilm(film);
    }

    @Override
    public int upFilm(Film film) {
        return filmMapper.upFilm(film);
    }

    @Override
    public int DelFilm(int ISDN) {
        return filmMapper.DelFilm(ISDN);
    }
}
