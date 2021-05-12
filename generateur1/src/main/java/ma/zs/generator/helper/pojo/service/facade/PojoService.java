package ma.zs.generator.helper.pojo.service.facade;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.vo.UserRequest;

/**
 * @author Ouiam
 *
 */
public interface PojoService {

	List<Pojo> fillPojoLists(List<Pojo> pojos);
	
	List<Pojo> validatePojos(List<Pojo> pojos);

	List<Pojo> convertJson(String json) throws JsonProcessingException;

	List<Pojo> convertYaml(String yaml) throws IOException;
	
}
