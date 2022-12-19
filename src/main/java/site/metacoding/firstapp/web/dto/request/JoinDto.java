package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.User;

@Setter
@Getter
public class JoinDto {
	private String userName;
	private String userPassword;
	private String userEmail;

	public User toEntity() {
//		User user = new User(this.userName, this.userPassword, this.userEmail, "user");
//		return user;
		return new User(this.userName, this.userPassword, this.userEmail, "user");
	}
}