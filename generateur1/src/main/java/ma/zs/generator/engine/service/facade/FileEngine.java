package ma.zs.generator.engine.service.facade;

import java.io.IOException;

import freemarker.template.TemplateException;
import ma.zs.generator.engine.bean.FileEngineConfig;

/**
 * @author Qada
 *
 */
public interface FileEngine {

	
	void generate(FileEngineConfig config, String generatedFolder) throws IOException, TemplateException;
}
