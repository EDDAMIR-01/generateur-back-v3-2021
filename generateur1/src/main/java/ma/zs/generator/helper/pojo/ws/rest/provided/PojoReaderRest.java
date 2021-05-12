/**
 * 
 */
package ma.zs.generator.helper.pojo.ws.rest.provided;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.reader.facade.PojoReader;

/**
 * @author Ouiam
 *
 */
@RestController
@RequestMapping("generator/pojo")
public class PojoReaderRest {
	
	@Autowired
	@Qualifier("jsonReader")
	PojoReader jsonService;
	@Autowired
	@Qualifier("yamlReader")
	PojoReader yamlService;
    
	@PostMapping("/uploadFile")
	public List<Pojo> readPojo(@RequestParam("file") MultipartFile file) {
		if(file.getOriginalFilename().endsWith(".yaml")) {
				try {
					return yamlService.getPojosFile(file);
				} catch (IOException | ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
			
		}else if(file.getOriginalFilename().endsWith(".json")) {
			try {
				return 	jsonService.getPojosFile(file);
			} catch (IOException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}
}
