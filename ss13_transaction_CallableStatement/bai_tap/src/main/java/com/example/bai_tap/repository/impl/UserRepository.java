package com.example.bai_tap.repository.impl;

import com.example.bai_tap.model.User;
import com.example.bai_tap.repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String SELECT = "call get_list_user()";
    private static final String INSERT = "INSERT INTO users (name, email, country) VALUES (?,?,?)";
    private static final String DELETE = "call delete_user_by_id(?)";
    private static final String FIND_USER_BY_ID = "SELECT * FROM users where id =?";
    private static final String UPDATE_USER_BY_ID = "call update_user_by_id (?,?,?,?)";

    @Override
    public List<User> getListUser() {
        Connection connection = BaseRepository.getConnection();
        List<User> list = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT);
//            Statement statement = connection.createStatement();
            ResultSet resultSet = callableStatement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void createNewUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteUser(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
//            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public User getUserById(int id) {
        Connection connection = BaseRepository.getConnection();
        User user=null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idd = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String countrySearch = resultSet.getString("country");
                user =new User(idd, name, email, countrySearch);
            }
//            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public void updateUser(User user, int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USER_BY_ID);
//            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_BY_ID);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<User> searchUserByName(String name) {
        List<User> listSearch = new ArrayList<>();
        List<User> list = this.getListUser();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getName().contains(name)){
                listSearch.add(list.get(i));
            }
        }
        return listSearch;
    }
}
