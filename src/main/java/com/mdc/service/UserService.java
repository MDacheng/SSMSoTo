package com.mdc.service;

import com.mdc.beans.Permission;
import com.mdc.beans.Role;
import com.mdc.beans.User;
import com.mdc.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User findUserByName(String username){
        return userDao.getUser(username);
    }

    public Set<Role> findRolesByName(String username){
        return userDao.getRoles(username);
    }

    public Set<Permission> findPermissionByName(String username){
        return userDao.getPermission(username);
    }
}
