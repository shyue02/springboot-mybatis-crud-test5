package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.User;
import site.metacoding.firstapp.domain.UserDao;
import site.metacoding.firstapp.service.UserService;
import site.metacoding.firstapp.web.dto.request.AdminLoginDto;
import site.metacoding.firstapp.web.dto.request.JoinDto;
import site.metacoding.firstapp.web.dto.request.LoginDto;
import site.metacoding.firstapp.web.dto.request.UserUpdateDto;
import site.metacoding.firstapp.web.dto.response.CMRespDto;

@RequiredArgsConstructor
@Controller
public class UserController {
	private final HttpSession session;
	private final UserDao userDao;
	private final UserService userService;

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
//			System.out.println(loginDto.getUserName());
			if(userPS.getRole().equals("user")) {
//				System.out.println("user 로그인 성공");
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
//			System.out.println(adminloginDto.getUserName());
			if(userPS.getRole().equals("admin")) {
//				System.out.println("admin 로그인 성공");
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
	
	@GetMapping("/api/joinForm/userNameSameCheck")
	public @ResponseBody  CMRespDto<Boolean> userNameSameCheck(String userName) {
		boolean isSame = userService.아이디중복확인(userName);
		return new CMRespDto<>(1, "성공", isSame);
	}
	
	@PostMapping("join")
	public String join(JoinDto joinDto) {
		userDao.insert(joinDto.toEntity());
		return "redirect:/loginForm";
	}
	
	
	// 회원 정보 페이지
	@GetMapping("/user/profile")
	public String userProfileForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		User userPS = userDao.findById(principal.getUserId());
		model.addAttribute("userProfile", userPS);
		return "user/userProfileForm";
	}
	
	// 회원 정보 수정
	@PostMapping("/user/profile")
	public String userUpdate(UserUpdateDto userUpdateDto) {
		// 1. principal에서 userId를 찾아옴
		User principal = (User) session.getAttribute("principal");
//		System.out.println(principal.getUserId() +  " userId를 가져옴");
		
		// 2, 영속화 된 객체 변경 -> DB 수행
		userDao.update(userUpdateDto.toEntity(principal.getUserId()));
//		System.out.println(userUpdateDto.getUserEmail() + " -> 수정 된 userEmail를 가져옴");
//		System.out.println(userUpdateDto.getUserPassword() + " -> 수정된 userPassword를 가져옴");	
		return "redirect:/user/profile"; 
	}
	
	
	// 회원 탈퇴 - 구매자 권한
	@PostMapping("/user/profile/delete")
	public String unregister(Integer userId) {
		User principal = (User) session.getAttribute("principal");
		userDao.deleteById(principal.getUserId());
		session.invalidate();		// -> 회원 탈퇴 버튼 클릭 시 세션 로그아웃 되도록
		return "redirect:/";
	}	


	// 유저 목록 페이지 - 관리자만 접근 가능
	@GetMapping("userListForm")
	public String userListForm(Model model) {
		List<User> getuserList = userDao.findAll();
		model.addAttribute("userlist", getuserList);
		
		User principal = (User) session.getAttribute("principal");
		if(principal.getRole().equals("admin")){
			return "/user/userListForm";
		}
		return "redirect:/";
	}
	
	// 유저 삭제 - 관리자 권한
		@PostMapping("userListForm/{userId}/delete")
		public String userDelete(@PathVariable Integer userId) {
			userDao.deleteById(userId);
			return "redirect:/userListForm";
		}
		
}

