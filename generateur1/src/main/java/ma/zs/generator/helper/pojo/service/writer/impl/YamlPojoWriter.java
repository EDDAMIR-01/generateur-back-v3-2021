/**
 * 
 */
package ma.zs.generator.helper.pojo.service.writer.impl;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import freemarker.template.TemplateException;
import ma.zs.generator.engine.service.util.ZipUtil;
import ma.zs.generator.helper.freemarker.service.facade.FreeMarkerService;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.writer.facade.PojoWriter;

/**
 * @author Ouiam
 *
 */
@Service("yamlWriter")
public class YamlPojoWriter implements PojoWriter {
	@Autowired
	private FreeMarkerService freeMarkerService;

	private String templateName = "YamlPojos.yaml.ftl";

	@Override
	public byte[] exportPojoFile(List<Pojo> pojos,String fileType)
			throws IOException, TemplateException {
		freeMarkerService.generateFile(pojos, templateName, "YamlPojos" , fileType, generatedFileFolder, templatePath, null);
		return ZipUtil.convertZipToByteArray(new File(generatedFileFolder+"//YamlPojos"+"."+fileType));
	}
}
