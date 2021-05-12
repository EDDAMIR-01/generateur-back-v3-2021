/**
 * 
 */
package ma.zs.generator.helper.pojo.service.writer.facade;

import java.io.IOException;
import java.util.List;

import freemarker.template.TemplateException;
import ma.zs.generator.helper.pojo.bean.Pojo;

/**
 * @author Ouiam
 *
 */
public interface PojoWriter {

	String generatedFileFolder = System.getProperty("user.home");
	String templatePath= "src/main/resources/pojos/export";
	
	byte[] exportPojoFile(List<Pojo> pojos, String fileType) throws IOException, TemplateException;
}
