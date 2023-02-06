package site.metacoding.firstapp.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.User;
import site.metacoding.firstapp.domain.UserDao;
import site.metacoding.firstapp.web.dto.request.UserUpdateDto;

@RequiredArgsConstructor
@Service
public class UserService {
	private final UserDao userDao;
	private final HttpSession session;

	public boolean 아이디중복확인(String userName) {
		User userPS = userDao.findByUserName(userName);

		if (userPS == null) { // 아이디 중복 x
			return false;
		} else { // 아이디 중복 o
			return true;
		}
	}

	public void 회원정보수정(UserUpdateDto userUpdateDto) {
		User principal = (User) session.getAttribute("principal");
		userDao.update(userUpdateDto.toEntity(principal.getUserId()));
	}
	
	public void 회원탈퇴(Integer userId) {
		User principal = (User) session.getAttribute("principal");
		userDao.deleteById(principal.getUserId());
		session.invalidate();
	}
}