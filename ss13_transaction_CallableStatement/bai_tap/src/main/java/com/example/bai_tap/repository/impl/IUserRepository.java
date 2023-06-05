package com.example.bai_tap.repository.impl;

import com.example.bai_tap.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getListUser();

    void createNewUser(User user);

    void deleteUser(int id);

    User getUserById(int id);

    void updateUser(User user, int id);

    List<User> searchUserByName(String name);
}
