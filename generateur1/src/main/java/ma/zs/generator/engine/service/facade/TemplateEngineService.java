package ma.zs.generator.engine.service.facade;

import java.io.File;
import java.io.IOException;
import java.util.List;

import freemarker.template.TemplateException;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.project.config.ProjectConfig;

/**
 * @author Qada
 *
 */
public interface TemplateEngineService {

	void generate(File templateFolder, String generatedFolder, List<Pojo> pojos ,ProjectConfig config) throws IOException, TemplateException;

	void scanTemplate(File template, String projectTemplatePath, List<Pojo> pojos, String outputFolder,ProjectConfig config)
			throws IOException, TemplateException;

}
