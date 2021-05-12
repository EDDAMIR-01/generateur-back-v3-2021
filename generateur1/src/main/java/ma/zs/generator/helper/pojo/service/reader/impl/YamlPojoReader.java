package ma.zs.generator.helper.pojo.service.reader.impl;

import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.yaml.snakeyaml.Yaml;

import ma.zs.generator.helper.pojo.bean.Field;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.bean.PojoConfig;
import ma.zs.generator.helper.pojo.bean.Type;
import ma.zs.generator.helper.pojo.service.facade.PojoService;
import ma.zs.generator.helper.pojo.service.reader.facade.PojoReader;
import ma.zs.generator.helper.pojo.service.util.PojoUtil;

/**
 * @author Ouiam & Zouani
 *
 */
@Service("yamlReader")
public class YamlPojoReader implements PojoReader {
	@Autowired 
	PojoService pojoService;

	public Map<String, Map<String, String>> parseYaml(Reader reader) {
		Yaml yaml = new Yaml();
		// key: pojoName , Map : fieldName, fieldType
		Map<String, Map<String, String>> yamlPojos = (Map<String, Map<String, String>>) yaml.load(reader);
		return yamlPojos;
	}

	public List<Pojo> linkPojoToField(Map<String, Map<String, String>> yamlPojos) {
		if (yamlPojos == null)
			yamlPojos = new HashMap<>();
		final Map<String, List<Field>> pojoField = yamlPojos.entrySet().stream()
				.collect(toMap(this::pojoName, this::fields));
		return pojoField.entrySet().stream().map(e -> new Pojo(e.getKey(), e.getValue())).collect(toList());
	}

	private String pojoName(Entry<String, Map<String, String>> yamlOuterMapEntry) {
		return yamlOuterMapEntry.getKey();
	}

	private List<Field> fields(Entry<String, Map<String, String>> yamlOuterMapEntry) {
		Map<String, String> yamlFields = yamlOuterMapEntry.getValue();
		if (yamlFields == null)
			return new ArrayList<>();
		return yamlFields.entrySet().stream().map(e -> new Field(e.getKey(), e.getValue()))
				.collect(Collectors.toList());
	}

	public void preparePojoYamlFile(List<Pojo> pojos) {
		for (Pojo pojo : pojos) {
			prepareRefAndId(pojo);
			findFieldSimple(pojo);
			findFieldCompositeList(pojo);
			findFieldGeneric(pojo);
		}
	}

	public void prepareRefAndId(Pojo pojo) {
		for (Field field : pojo.getFields()) {
			String type = field.getType().getSimpleName();
			String name = field.getName();
			if (type.contains(" ")) {
				String[] typesWithIdOrRef = type.split(" ");
				type = typesWithIdOrRef[0];
				field.getType().setSimpleName(type);
				if (typesWithIdOrRef[1].equals(PojoConfig.getIdDefaultName())) {
					pojo.setId(new Field(name, type));
				} else if (typesWithIdOrRef[1].equals(PojoConfig.getReference())) {
					pojo.setReference(new Field(name, type));
				}
			}
		}
	}

	public void findFieldSimple(Pojo pojo) {
		List<Field> fields = pojo.getFields();
		for (Field field : fields) {
			if (PojoUtil.isPrimitif(field.getType().getSimpleName())) {
				field.setSimple(true);
				field.setGeneric(false);
				field.setList(false);
			} else {
				field.setSimple(false);
			}
		}
	}

	public void findFieldGeneric(Pojo pojo) {
		List<Field> fields = pojo.getFields();
		for (Field field : fields) {
			if (!field.isSimple() && !field.isList()) {
				field.setGeneric(true);
				field.setList(false);
			}
		}
	}

	public void findFieldCompositeList(Pojo pojo) {
		List<Field> fields = pojo.getFields();
		for (Field field : fields) {
			String type = field.getType().getName();
			if (type.contains(" ")) {
				String[] types = type.split(" ");
				if (PojoUtil.isList(types[1])) {
					field.setType(new Type(types[0]));
					field.setList(true);
					field.setGeneric(false);
				}
			}
		}
	}
	
	public List<Pojo> getPojosFile(MultipartFile file) throws IOException {
		Path temp = Paths.get("src\\main\\resources\\pojos\\file.yaml");
		file.transferTo(temp);
		final File yamlFile = new File(temp.toString());
		Map<String, Map<String, String>> yamlPojos = parseYaml(new FileReader(yamlFile));
		List<Pojo> pojos = linkPojoToField(yamlPojos);
		preparePojoYamlFile(pojos);
		pojoService.fillPojoLists(pojos);
		return pojos;
	}
	
}
