package com.mdc.util;

import com.mdc.beans.Permission;
import com.mdc.beans.Role;
import com.mdc.beans.User;
import com.mdc.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by mengdacheng on 2017/5/5.
 * 获取用户的角色和匹配信息
 */
public class UserRealm extends AuthorizingRealm{

    @Autowired
    private UserService userService;

    /**
     * 提供用户信息返回认证信息
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String)authenticationToken.getPrincipal();
        User user = userService.findUserByName(username);
        if(user == null) throw new UnknownAccountException();
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), ByteSource.Util.bytes(user.getSalt()), getName());
        return authenticationInfo;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = (String) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Set<Role> roles = userService.findRolesByName(username);
        Set<String> roleName = new HashSet<String>();
        for(Role role : roles){
            roleName.add(role.getRoleName());
        }
        authorizationInfo.setRoles(roleName);
        Set<Permission> permissions = userService.findPermissionByName(username);
        Set<String> permissionName = new HashSet<String>();
        for(Permission item : permissions){
            permissionName.add(item.getPermission());
        }
        authorizationInfo.setStringPermissions(permissionName);
        return authorizationInfo;
    }
}
