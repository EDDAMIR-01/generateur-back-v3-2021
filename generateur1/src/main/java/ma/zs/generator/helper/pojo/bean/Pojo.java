/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.zs.generator.helper.pojo.bean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

/**
 *
 * @author ismail
 */
public class Pojo {

	private String name;
	private Field id;
	private Field reference;
	private Role role;
	private List<Field> fields = new ArrayList<>() ;
	@JsonIgnore
	private Set<Type> types;
	@JsonProperty(access=Access.READ_ONLY)
	private List<Field> fieldsGeneric;
	@JsonProperty(access=Access.READ_ONLY)
	private List<Field> fieldsSimple;
	@JsonProperty(access=Access.READ_ONLY)
	private List<Field> fieldsList;
	@JsonIgnore
	private List<Field> fieldsSimpleNumberOrDate;
	@JsonIgnore
	private List<Field> fieldsSimpleStringOrBoolean;
	@JsonProperty(access=Access.READ_ONLY)
    private boolean hasBigDecimal ;
	@JsonProperty(access=Access.READ_ONLY)
    private boolean hasList;
	@JsonProperty(access=Access.READ_ONLY)
    private boolean idString;
	@JsonProperty(access=Access.READ_ONLY)
    private boolean hasDate;
	
	 private boolean compactView = true;
    

	public Pojo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pojo(String name, List<Field> fields) {
	super();
	this.name = name;
	this.fields = fields;
}


	public Pojo(String pojoName, String idName, String idType) {
		this.name = pojoName;
		this.id = new Field(idName, idType);
	}

	public Pojo(String pojoName, String idName, String idType, String referenceName, String referenceType) {
		this.id =  new Field(idName, idType);
		this.reference = new Field(referenceName, referenceType);
		this.name = pojoName;
	}

	public List<Field> getFieldsGeneric() {
		if(fieldsGeneric==null) {
			fieldsGeneric= new ArrayList();
		}
		return fieldsGeneric;
	}

	
	public List<Field> getFieldsList() {
		if(fieldsList==null) {
			fieldsList= new ArrayList();
		}
		return fieldsList;
	}

	public void setFieldsList(List<Field> fieldsList) {
		this.fieldsList = fieldsList;
	}

	public Field getId() {
		return id;
	}

	public void setId(Field id) {
		this.id = id;
	}

	public Field getReference() {
		return reference;
	}

	public void setReference(Field reference) {
		this.reference = reference;
	}

	public void setFieldsGeneric(List<Field> fieldsGeneric) {
		this.fieldsGeneric = fieldsGeneric;
	}

	public List<Field> getFieldsSimple() {
		if(fieldsSimple==null) {
			fieldsSimple= new ArrayList();
		}
		return fieldsSimple;
	}

	public void setFieldsSimple(List<Field> fieldsSimple) {
		this.fieldsSimple = fieldsSimple;
	}



	public List<Field> getFields() {
		if(fields==null) {
			fields= new ArrayList();
		}
		return fields;
	}

	public void setFields(List<Field> fields) {
		this.fields = fields;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String pojoName) {
		this.name = pojoName;
	}

	public List<Field> getFieldsSimpleNumberOrDate() {
		if(fieldsSimpleNumberOrDate==null) {
			fieldsSimpleNumberOrDate= new ArrayList();
		}
		return fieldsSimpleNumberOrDate;
	}

	public void setFieldsSimpleNumberOrDate(List<Field> fieldsSimpleNumberOrDate) {
		this.fieldsSimpleNumberOrDate = fieldsSimpleNumberOrDate;
	}

	public List<Field> getFieldsSimpleStringOrBoolean() {
		if(fieldsSimpleStringOrBoolean==null) {
			fieldsSimpleStringOrBoolean= new ArrayList();
		}
		return fieldsSimpleStringOrBoolean;
	}

	public void setFieldsSimpleStringOrBoolean(List<Field> fieldsSimpleStringOrBoolean) {
		this.fieldsSimpleStringOrBoolean = fieldsSimpleStringOrBoolean;
  
	}


	public boolean isHasBigDecimal() {
		return hasBigDecimal;
	}


	public void setHasBigDecimal(boolean hasBigDecimal) {
		this.hasBigDecimal = hasBigDecimal;
	}


	public boolean isHasList() {
		return hasList;
	}


	public void setHasList(boolean hasList) {
		this.hasList = hasList;
	}


	public boolean isIdString() {
		return idString;
	}


	public void setIdString(boolean idString) {
		this.idString = idString;
	}


	public boolean isHasDate() {
		return hasDate;
	}


	public void setHasDate(boolean hasDate) {
		this.hasDate = hasDate;
	}

	public boolean isCompactView() {
		return compactView;
	}

	public void setCompactView(boolean compactView) {
		this.compactView = compactView;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Type> getTypes() {
	    if(this.types==null)
	    	this.types = new HashSet();
		return types;
	}

	public void setTypes(Set<Type> types) {
		this.types = types;
	}
	
	
	

}
