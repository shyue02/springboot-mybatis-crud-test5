package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.User;

@Setter
@Getter
public class UserUpdateDto {
	private String userPassword;
	private String userEmail;

	public User toEntity(Integer userId) {
		User user = new User(this.userPassword, this.userEmail, userId);
		return user;
	}
}
