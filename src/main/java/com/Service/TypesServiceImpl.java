package com.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.TypesMapper;
import com.Entity.Types;

/**
 * @author zhang
 */
@Service
public class TypesServiceImpl implements TypesService {

    @Autowired
    private TypesMapper typesMapper;

    @Override
    public Types selectTypeByID(int id) {
        return typesMapper.selectTypeByID(id);
    }

    @Override
    public List<Types> Alltypes() {
        return typesMapper.Alltypes();
    }

    @Override
    public int DeletetypeById(int id) {
        return typesMapper.DeletetypeById(id);
    }

    @Override
    public int Updatetype(Types types) {
        return typesMapper.Updatetype(types);
    }

    @Override
    public int addtype(Types types) {
        return typesMapper.addtype(types);
    }
}
