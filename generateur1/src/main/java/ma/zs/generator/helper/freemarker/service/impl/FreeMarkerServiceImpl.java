package ma.zs.generator.helper.freemarker.service.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import ma.zs.generator.helper.freemarker.service.facade.FreeMarkerService;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.project.config.ProjectConfig;

/**
 * @author Ouiam
 *
 */
@Service
public class FreeMarkerServiceImpl implements FreeMarkerService {
	
	@Override
	public Configuration initConfiguration() throws IOException {
		Configuration config = new Configuration(Configuration.VERSION_2_3_28);
		config.setDefaultEncoding("UTF-8");
		config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		config.setLogTemplateExceptions(false);
		config.setWrapUncheckedExceptions(true);
		return config;
	}
	
	@Override
	public void generateFile(List<Pojo> pojos, String templateName, String fileName, String extensions,
			String outputDirectory, String templatePath,ProjectConfig config) throws IOException, TemplateException {
		Configuration configuration = initConfiguration();
		Map<String, Object> freemarkerDataModel = new HashMap<>();
		configuration.setDirectoryForTemplateLoading(new File(templatePath));
		Template template = configuration.getTemplate(templateName);
		freemarkerDataModel.put("pojos", pojos);
		freemarkerDataModel.put("config",config);
		File javaSourceFile = new File(outputDirectory, fileName + "." + extensions);
		Writer javaSourceFileWriter = new FileWriter(javaSourceFile);
		template.process(freemarkerDataModel, javaSourceFileWriter);
		javaSourceFileWriter.close();
	}
	
	@Override
	public void generateFileWithOnePojo(Pojo pojo ,String templateName, String templatePath ,String generatedFileName,
			String outputDirectory,ProjectConfig config) throws IOException, TemplateException {
		Configuration configuration = initConfiguration();
		Map<String, Object> freemarkerDataModel = new HashMap<>();
		configuration.setDirectoryForTemplateLoading(new File(templatePath));
		Template template = configuration.getTemplate(templateName);
			freemarkerDataModel.put("pojo", pojo);
			freemarkerDataModel.put("config", config);
			File javaSourceFile = new File(outputDirectory,generatedFileName);
			Writer javaSourceFileWriter = new FileWriter(javaSourceFile);
			template.process(freemarkerDataModel, javaSourceFileWriter);
			javaSourceFileWriter.close();
	}

	
	@Override
	public void generateFileWithOnePojo(Pojo pojo, String fileName, String generatedFolder, String template)throws IOException, TemplateException {
	
		Configuration configuration = initConfiguration();
		Template t = new Template("template", new StringReader(template), configuration);
		Map<String, Object> freemarkerDataModel = new HashMap<>();
		freemarkerDataModel.put("pojo", pojo);
		File javaSourceFile = new File(generatedFolder,fileName);
		Writer javaSourceFileWriter = new FileWriter(javaSourceFile);
		t.process(freemarkerDataModel, javaSourceFileWriter);
		javaSourceFileWriter.close();
	}

	@Override
	public void generateFile(List<Pojo> pojos, String fileName, String generatedFolder, String template)throws IOException, TemplateException {
		Configuration configuration = initConfiguration();
		Template t = new Template("template", new StringReader(template), configuration);
		Map<String, Object> freemarkerDataModel = new HashMap<>();
		freemarkerDataModel.put("pojos", pojos);
		File javaSourceFile = new File(generatedFolder,fileName);
		Writer javaSourceFileWriter = new FileWriter(javaSourceFile);
		t.process(freemarkerDataModel, javaSourceFileWriter);
		javaSourceFileWriter.close();

	}
}
