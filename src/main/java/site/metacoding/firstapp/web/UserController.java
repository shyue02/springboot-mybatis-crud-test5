package site.metacoding.firstapp.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.User;
import site.metacoding.firstapp.domain.UserDao;
import site.metacoding.firstapp.web.dto.request.AdminLoginDto;
import site.metacoding.firstapp.web.dto.request.JoinDto;
import site.metacoding.firstapp.web.dto.request.LoginDto;

@RequiredArgsConstructor
@Controller
public class UserController {
	private final HttpSession session;
	private final UserDao userDao;

	// 구매자 로그인
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(LoginDto loginDto) {
		User userPS = userDao.login(loginDto);
		if(userPS != null) {
			session.setAttribute("principal", userPS);
			System.out.println(loginDto.getUserName());
			if(userPS.getRole().equals("user")) {
				System.out.println("user 로그인 성공");
				return "redirect:/";
			}
		}
		System.out.println("user 로그인 실패");
		return "redirect:/loginForm";
	}
	
	
	// 관리자 로그인
	@GetMapping("/adminloginForm")
	public String adminloginForm() {
		return "user/adminloginForm";
	}
	
	@PostMapping("/adminlogin")
	public String adminlogin(AdminLoginDto adminloginDto) {
		User userPS = userDao.adminlogin(adminloginDto);
		if(userPS != null) {
			session.setAttribute("principal", userPS);
			System.out.println(adminloginDto.getUserName());
			if(userPS.getRole().equals("admin")) {
				System.out.println("admin 로그인 성공");
				return "redirect:/";
			}
		}
		System.out.println("admin 로그인 실패");
		return "redirect:/adminloginForm";
	}


	//로그아웃
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 회원가입
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@PostMapping("join")
	public String join(JoinDto joinDto) {
		userDao.insert(joinDto.toEntity());
		return "redirect:/loginForm";
	}
}

