package com.locnv.dao;

import com.locnv.Model.User;

public interface IUserDAO extends IGenericDAO<User> {
    User findUser(String username,String password, Integer status);
    User finUserById(Long id);
    User findUserByUserName(String username);
    Long add(User user);
    Boolean changeStatus(User user);
    Boolean updateUserInfor(User user);
}
