package com.example.bai_tap.service;

import com.example.bai_tap.model.User;
import com.example.bai_tap.repository.impl.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public List<User> getListUser() {
        return userRepository.getListUser();
    }

    @Override
    public void createNewUser(User user) {
        userRepository.createNewUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void updateUser(User user, int id) {
        userRepository.updateUser(user, id);
    }

    @Override
    public List<User> searchUserByName(String name) {
        return userRepository.searchUserByName(name);

    }
}
