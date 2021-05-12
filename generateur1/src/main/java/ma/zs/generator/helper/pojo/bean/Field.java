package ma.zs.generator.helper.pojo.bean;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

/**
 * @author Ouiam
 *
 */
public class Field {
	private String name;
	private Type type;
	private boolean simple;
	private boolean list;
	private boolean generic;
	@JsonProperty(access=Access.WRITE_ONLY)
	private Pojo pojo;
	private Boolean comboBox = true;
	private String mappedBy;
	public Field(String name, String typeName) {
		super();
		this.name = name;
		this.type = new Type(typeName);
	}
	
	public Field(String name, Type type) {
		super();
		this.name = name;
		this.type = type;
	}
	public Field() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public boolean isList() {
		return list;
	}

	public void setList(boolean list) {
		this.list = list;
	}

	public boolean isGeneric() {
		return generic;
	}

	public void setGeneric(boolean generic) {
		this.generic = generic;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public boolean isSimple() {
		return simple;
	}
	public void setSimple(boolean simple) {
		this.simple = simple;
	}

	public Pojo getPojo() {
		return pojo;
	}

	public void setPojo(Pojo pojo) {
		this.pojo = pojo;
	}

	public Boolean getComboBox() {
		return comboBox;
	}

	public void setComboBox(Boolean comboBox) {
		this.comboBox = comboBox;
	}

	public String getMappedBy() {
		return mappedBy;
	}

	public void setMappedBy(String mappedBy) {
		this.mappedBy = mappedBy;
	}
	
	
	
	
}
