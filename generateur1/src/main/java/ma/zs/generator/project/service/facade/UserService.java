package ma.zs.generator.project.service.facade;

import org.springframework.security.core.userdetails.UserDetailsService;

import ma.zs.generator.project.bean.User;

public interface UserService extends UserDetailsService {


	public int saveWithRoles(User user);
	public String authentificate(String login, String pass) ;
    
	
}