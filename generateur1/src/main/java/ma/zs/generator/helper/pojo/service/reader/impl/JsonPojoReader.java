/**
 * 
 */
package ma.zs.generator.helper.pojo.service.reader.impl;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.facade.PojoService;
import ma.zs.generator.helper.pojo.service.reader.facade.PojoReader;

/**
 * @author Qada
 *
 */
@Service("jsonReader")
public class JsonPojoReader implements PojoReader {
	
	@Autowired 
	PojoService pojoService;
  
	List<Pojo> getPojos(String filePath) throws FileNotFoundException, IOException, ParseException{
		JSONParser parser = new JSONParser();
	      Object obj = parser.parse(new FileReader(filePath));
	         JSONObject jsonObject = (JSONObject)obj;
	         List<Pojo> pojos = (List<Pojo>)jsonObject.get("pojos");
		return pojos;
	}
	
	public List<Pojo> getPojosFile(MultipartFile file) throws IOException, ParseException {
		Path temp = Paths.get("src\\main\\resources\\pojos\\file.json");
		file.transferTo(temp);
		pojoService.fillPojoLists(getPojos(temp.toString()));
		return getPojos(temp.toString());
	}
}
