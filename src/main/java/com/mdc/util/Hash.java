package com.mdc.util;

import org.apache.shiro.crypto.hash.SimpleHash;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Random;

/**
 * Created by mengdacheng on 2017/5/9.
 */
public class Hash {
    public String getSalt(String username){
        Random rnd = new Random(System.currentTimeMillis());
        String str = (username + rnd.nextLong());
        MessageDigest md5 = null;
        try{
            md5 = MessageDigest.getInstance("MD5");
            md5.update(str.getBytes());
            return new BigInteger(1, md5.digest()).toString(16);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args){
        String salt = "3c00d9b0bc5b1b57fe8a62ca30e758a2";
        SimpleHash simpleHash = new SimpleHash("MD5", "123456", salt, 2);

        System.out.println(simpleHash);
    }
}
