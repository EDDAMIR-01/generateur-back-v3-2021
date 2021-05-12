package ma.zs.generator.helper.pojo.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import ma.zs.generator.helper.pojo.service.reader.impl.YamlPojoReader;
import ma.zs.generator.helper.pojo.service.util.JsonUtil;
import ma.zs.generator.helper.pojo.service.util.YamlUtil;
import ma.zs.generator.helper.pojo.service.vo.UserRequest;
import ma.zs.generator.project.config.FrontendConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.zs.generator.engine.service.util.StringUtil;
import ma.zs.generator.helper.pojo.bean.Field;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.service.facade.PojoService;
import ma.zs.generator.helper.pojo.service.util.PojoUtil;

/**
 * @author amine & oussama
 *
 */
@Service
public class PojoServiceImpl implements PojoService {

	private FrontendConfig frontendConfig = new FrontendConfig();

	@Autowired
	private YamlPojoReader yamlPojoReader;
	
	public List<Pojo> validatePojos(List<Pojo> pojos) {
		fillPojoLists(pojos);
		for (Pojo pojo : pojos) {
			setFieldsSimpleMinMaxAndSimple(pojo);
			setNestedPojo(pojo, pojos);
			preparePojoBoolean(pojo);
			preparePojoComplex(pojo);
	       
		}
		return pojos;
	}

	public List<Pojo> fillPojoLists(List<Pojo> pojos){
		for (Pojo pojo : pojos) {
		List<Field> fields = pojo.getFields();
		fields.parallelStream().forEach(field->{
			if(field.isGeneric())
				pojo.getFieldsGeneric().add(field);
			else if(field.isList()) {
				   if(StringUtil.isEmpty(field.getMappedBy()))
				      field.setMappedBy(pojo.getName().toLowerCase());
				pojo.getFieldsList().add(field);

			}
			else if(field.isSimple())
				pojo.getFieldsSimple().add(field);
		});
	}
		return pojos;
	}
	
	public Pojo findPojoByName(String pojoName, List<Pojo> pojos) {
		return pojos.stream().filter(p -> p.getName().equals(pojoName)).findFirst().orElse(null);
	}

	public void setNestedPojo(Pojo pojo, List<Pojo> pojos) {
		List<Field> fieldGenerics = pojo.getFieldsGeneric();
		List<Field> fieldLists = pojo.getFieldsList();
		if(fieldGenerics != null) {
		fieldGenerics.forEach(field->{
			Pojo nestedPojo = findPojoByName(field.getType().getSimpleName(), pojos);
			pojo.getTypes().add(field.getType());
			field.setPojo(nestedPojo);
		});
		}
		if(fieldLists != null) {
		fieldLists.forEach(field->{
			Pojo nestedPojo = findPojoByName(field.getType().getSimpleName(), pojos);
			pojo.getTypes().add(field.getType());
			field.setPojo(nestedPojo);
		});
		}
	}

	public void preparePojoBoolean(Pojo pojo) {
		List<Field> simpleFields = pojo.getFieldsSimple();
		for (Field field : simpleFields) {
			if (field.getType().getSimpleName().equals("Date"))
				pojo.setHasDate(true);
			if (field.getType().getSimpleName().equals("BigDecimal"))
				pojo.setHasBigDecimal(true);
		}
		if (pojo.getId().getType().getSimpleName().equals("String"))
			pojo.setIdString(true);
		if (pojo.getFieldsList().size() > 0)
			pojo.setHasList(true);
	}
	
	public void setFieldsSimpleMinMaxAndSimple(Pojo pojo) {
		List<Field> fields = pojo.getFieldsSimple();
		List<Field> fieldsSimpleMinMax = new ArrayList<>();
		List<Field> fieldsSimpleStringBolean = new ArrayList<>();
		for (Field field : fields) {
			System.out.println(field.getName()+" in "+pojo.getName());
			if (PojoUtil.isNumberOrDate(field.getType().getSimpleName())) {
				fieldsSimpleMinMax.add(field);
			} else {
				fieldsSimpleStringBolean.add(field);
			}
		}
		if (!fieldsSimpleMinMax.isEmpty()) {
			pojo.setFieldsSimpleNumberOrDate(fieldsSimpleMinMax);
		}
		if (!fieldsSimpleStringBolean.isEmpty()) {
			pojo.setFieldsSimpleStringOrBoolean(fieldsSimpleStringBolean);
		}

	}

	public void preparePojoComplex(Pojo pojo) {
		if (pojo.getFields().size() >= frontendConfig.getMaxFields()) {
			pojo.setCompactView(false);
		}
	}

	public List<Pojo> convertJson(String json) throws JsonProcessingException {
		List<Pojo> pojos =  JsonUtil.cvrtJson(json,Pojo.class);
		yamlPojoReader.preparePojoYamlFile(pojos);
		fillPojoLists(pojos);
		return pojos;
	}

	public List<Pojo> convertYaml(String yaml) throws IOException {
		List<Pojo> pojos = YamlUtil.getListOfObjects(yaml,Pojo.class);
		yamlPojoReader.preparePojoYamlFile(pojos);
		fillPojoLists(pojos);
		return pojos;
	}

}
