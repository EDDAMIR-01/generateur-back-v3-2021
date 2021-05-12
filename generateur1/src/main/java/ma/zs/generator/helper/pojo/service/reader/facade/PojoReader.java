/**
 * 
 */
package ma.zs.generator.helper.pojo.service.reader.facade;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.web.multipart.MultipartFile;

import ma.zs.generator.helper.pojo.bean.Pojo;

/**
 * @author Ouiam
 *
 */

public interface PojoReader {
	
	public List<Pojo> getPojosFile(MultipartFile file) throws IOException, ParseException;
	
	



}
