package  ${config.domain}.${config.groupId}.${config.projectName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ${config.mainClass} {

	public static void main(String[] args) {
		SpringApplication.run(${config.mainClass}.class, args);
	}

}
