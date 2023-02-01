package site.metacoding.firstapp.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.User;
import site.metacoding.firstapp.domain.UserDao;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;

	public boolean 아이디중복확인(String userName) {
		User userPS = userDao.findByUserName(userName);

		if (userPS == null) { // 아이디 중복 x
			return false;
		} else { // 아이디 중복 o
			return true;
		}
	}

}