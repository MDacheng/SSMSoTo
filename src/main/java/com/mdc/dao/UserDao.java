package com.mdc.dao;

import com.mdc.beans.Permission;
import com.mdc.beans.Role;
import com.mdc.beans.User;

import java.util.Set;

/**
 * Created by mengdacheng on 2017/5/6.
 */
public interface UserDao {
    User getUser(String username);
    Set<Role> getRoles(String name);
    Set<Permission> getPermission(String name);
}
