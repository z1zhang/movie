package com.Dao;

import java.util.List;

import com.Entity.Types;

/**
 * @author zhang
 */
public interface TypesMapper {

    /**
     * 通过ID查找type
     *
     * @param id
     * @return
     */
    public Types selectTypeByID(int id);

    /**
     * 查询全部
     *
     * @return
     */
    public List<Types> Alltypes();

    /**
     * 通过id删除type
     *
     * @param id
     * @return
     */
    public int DeletetypeById(int id);

    /**
     * 更新type
     *
     * @param types
     * @return
     */
    public int Updatetype(Types types);

    /**
     * 添加type
     *
     * @param types
     * @return
     */
    public int addtype(Types types);

}
