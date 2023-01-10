package site.metacoding.firstapp.domain;

import java.util.List;

import site.metacoding.firstapp.web.dto.request.AdminLoginDto;
import site.metacoding.firstapp.web.dto.request.LoginDto;
import site.metacoding.firstapp.web.dto.request.UserUpdateDto;

public interface UserDao {
    public User findById(Integer userId);
    public List<User> findAll();
    public int insert(User user);
    public int update(User user);
    public int deleteById(Integer userId); 
    public User login(LoginDto loginDto);
    public User adminlogin(AdminLoginDto adminloginDto);
}
