package ma.zs.generator.engine.bean;

import java.util.List;

import ma.zs.generator.helper.pojo.bean.Pojo;

/**
 * @author Qada
 *
 */
public class FileEngineConfig {

	private String nameOrSuffix;
	private String template;
	private String extension;
	private boolean foreachEntities;
	private List<Pojo> pojos;
	
	
	public FileEngineConfig() {
		super();
	}
	
	public String getNameOrSuffix() {
		return nameOrSuffix;
	}
	public void setNameOrSuffix(String nameOrSuffix) {
		this.nameOrSuffix = nameOrSuffix;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	
	public boolean isForeachEntities() {
		return foreachEntities;
	}

	public void setForeachEntities(boolean foreachEntities) {
		this.foreachEntities = foreachEntities;
	}

	public List<Pojo> getPojos() {
		return pojos;
	}

	public void setPojos(List<Pojo> pojos) {
		this.pojos = pojos;
	}

	
}
