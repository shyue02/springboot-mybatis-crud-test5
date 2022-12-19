package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AdminLoginDto {
	private String userName;
	private String userPassword;
	private String role;
}
