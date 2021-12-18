package com.Entity;

/**
 * @author zhang
 */
public class Types {

    private Integer id;
    private String type;

    @Override
    public String toString() {
        return "types{" + "id=" + id + ", type='" + type + '\'' + '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Types() {}

    public Types(Integer id, String type) {
        this.id = id;
        this.type = type;
    }
}
