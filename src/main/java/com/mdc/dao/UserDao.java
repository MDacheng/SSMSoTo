package com.mdc.dao;

import com.mdc.beans.Permission;
import com.mdc.beans.Role;
import com.mdc.beans.User;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by mengdacheng on 2017/5/6.
 */
@Component
@MapperScan
public interface UserDao {
    User getUser(String username);
    Set<Role> getRoles(String name);
    Set<Permission> getPermission(String name);
}
