package cn.itcast.service;

import cn.itcast.pojo.Users;
import cn.itcast.pojo.UsersExample;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author Liuming
 * @date 2019/10/30
 */
public interface UserService {
    PageInfo<Users> findAll(UsersExample usersExample, int page, int pageSize);
    Users findById(int id);

    void edit(Users user);


    void add(Users user);
}
