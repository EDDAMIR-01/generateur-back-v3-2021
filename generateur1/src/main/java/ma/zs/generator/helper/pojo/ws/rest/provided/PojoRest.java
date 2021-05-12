package ma.zs.generator.helper.pojo.ws.rest.provided;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import ma.zs.generator.helper.pojo.service.vo.UserRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.facade.PojoService;

/**
 * @author amine & oussama
 *
 */
@RestController
@RequestMapping("generator/pojo")
public class PojoRest {
	@Autowired
	PojoService pojoService;

	@PostMapping("/getPojos")
	public List<Pojo> validatePojos(@RequestBody List<Pojo> pojos){
		return pojoService.validatePojos(pojos);
	}

	@GetMapping ("/convertJson/{json}")
	public List<Pojo> convertJson(@PathVariable String json) throws JsonProcessingException {
		return pojoService.convertJson(json);
	}
    @GetMapping("/convertYaml/{yaml}")
	public List<Pojo> convertYaml(@PathVariable String yaml) throws IOException {
		return pojoService.convertYaml(yaml);
	}
}
