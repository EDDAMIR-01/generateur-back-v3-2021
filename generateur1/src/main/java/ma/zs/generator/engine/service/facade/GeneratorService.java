package ma.zs.generator.engine.service.facade;

import org.springframework.web.multipart.MultipartFile;

import ma.zs.generator.engine.bean.FileEngineConfig;
import ma.zs.generator.project.bean.GeneratedProject;
import ma.zs.generator.project.config.UserConfig;

/**
 * @author Qada
 *
 */
public interface GeneratorService {

	GeneratedProject  generate(UserConfig userConfig);

	GeneratedProject generate(FileEngineConfig config);

	byte[] generate(String backend, String frontend, MultipartFile file);



}
