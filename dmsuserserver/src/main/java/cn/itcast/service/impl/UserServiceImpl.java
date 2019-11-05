package cn.itcast.service.impl;

import cn.itcast.dao.UsersMapper;
import cn.itcast.pojo.Users;
import cn.itcast.pojo.UsersExample;
import cn.itcast.service.UserService;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Liuming
 * @date 2019/10/30
 */
@Service(interfaceClass = UserService.class)
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersMapper userMapper;
    @Override
    public PageInfo<Users> findAll(UsersExample usersExample, int page, int pageSize) {
        PageHelper.startPage(page,pageSize);
        List<Users> all = userMapper.selectByExample(usersExample);
        return new PageInfo<>(all);
    }

    /**
     * 回显
     * @param id
     * @return
     */
    @Override
    public Users findById(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改
     * @param user
     */
    @Override
    public void edit(Users user) {
        userMapper.updateByPrimaryKeySelective(user);
    }


    @Override
    public void add(Users user) {
        userMapper.insert(user);
    }
}
