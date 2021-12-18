package com.Entity;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author zhang
 */
public class News {
    @NotNull
    private Integer ISDN;
    @NotNull
    private String title;
    @NotNull
    private String author;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past
    private Date date;
    @NotNull
    private String description;

    public News(Integer ISDN, String title, String author, Date date, String description) {
        this.ISDN = ISDN;
        this.title = title;
        this.author = author;
        this.date = date;
        this.description = description;
    }

    @Override
    public String toString() {
        return "news{" + "ISDN=" + ISDN + ", title='" + title + '\'' + ", author='" + author + '\'' + ", date=" + date
            + ", description='" + description + '\'' + '}';
    }

    public News() {}

    public Integer getISDN() {
        return ISDN;
    }

    public void setISDN(Integer ISDN) {
        this.ISDN = ISDN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
