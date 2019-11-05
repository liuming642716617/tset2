package cn.itcast.web.controller;


import cn.itcast.pojo.Users;
import cn.itcast.pojo.UsersExample;
import cn.itcast.service.UserService;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Liuming
 * @date 2019/10/30
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Reference
    private UserService userService;


    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest request, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize) {
        UsersExample userExample = new UsersExample();
        PageInfo<Users> all = userService.findAll(userExample, page, pageSize);
        request.setAttribute("pageInfo", all);
        return "user-list";
    }

    /**
     * 回显
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(HttpServletRequest request, int id) {
        Users user = userService.findById(id);
        request.setAttribute("user", user);
        return "user-edit";
    }


    /**
     * 修改
     * @param
     * @param
     * @return
     */
    @RequestMapping("/edit")
    public String edit(Users user) {
       userService.edit(user);
        return "redirect:/user/findAll.do";
    }
    @RequestMapping("/add")
    public String add(Users user) {
        userService.add(user);
        return "redirect:/user/findAll.do";
    }
}
