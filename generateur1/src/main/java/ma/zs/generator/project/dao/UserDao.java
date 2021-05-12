package ma.zs.generator.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.zs.generator.project.bean.User;




@Repository
public interface UserDao extends JpaRepository<User,Long> {

	User findByUsername(String username);


}