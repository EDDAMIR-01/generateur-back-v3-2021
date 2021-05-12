/**
 * 
 */
package ma.zs.generator.helper.pojo.ws.rest.provided;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import freemarker.template.TemplateException;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.writer.facade.PojoWriter;

/**
 * @author Ouiam
 *
 */
@RestController
@RequestMapping("generator/pojo/export")
public class PojoWriterRest {
	@Autowired
	@Qualifier("yamlWriter")
	PojoWriter yamlService;
	@Autowired
	@Qualifier("jsonWriter")
	PojoWriter jsonService;

    
	@PostMapping("/exportFile/fileType/{fileType}")
	public byte[] exportPojoFile(@RequestBody List<Pojo> pojos, @PathVariable String fileType) throws IOException, ParseException, TemplateException {
		if(fileType.equals("yaml")) {
			return yamlService.exportPojoFile(pojos, fileType);
		}else if(fileType.equals("json")) {
			return 	jsonService.exportPojoFile(pojos, fileType);
		}
		return null;
	}
}


