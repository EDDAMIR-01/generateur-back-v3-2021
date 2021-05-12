package ${config.domain}.${config.groupId}.${config.projectName}.${config.bean};

import javax.persistence.ManyToOne;
<#if pojo.hasList>
import java.util.List;
import javax.persistence.OneToMany;
</#if>
<#if pojo.hasDate>
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;
</#if>
<#if pojo.hasBigDecimal>
import java.math.BigDecimal;   
</#if>
import javax.persistence.Entity;
import javax.persistence.Id;
<#if !pojo.idString>
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
</#if>
<#list pojo.fieldsGeneric as fieldGeneric> 
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${fieldGeneric.type.simpleName};
</#list>

@Entity
public class ${pojo.name} {

     @Id
<#if !pojo.idString>
     @GeneratedValue(strategy = GenerationType.AUTO)
</#if>
     private ${pojo.id.type.simpleName} ${pojo.id.name};

<#list pojo.fieldsSimple as fieldSimple>
    <#if pojo.id.name != fieldSimple.name>
        <#if fieldSimple.type.simpleName =="Date">
     @JsonFormat(pattern="yyyy-MM-dd")
     @Temporal(TemporalType.DATE)
        </#if>
     private ${fieldSimple.type.simpleName} ${fieldSimple.name} ;
    </#if>
</#list>

<#list pojo.fieldsGeneric as fieldGeneric>
     @ManyToOne
	private ${fieldGeneric.type.simpleName} ${fieldGeneric.name} ;
</#list>
<#list pojo.fieldsList as fieldList> 
    <#if fieldList.mappedBy??>
     @OneToMany(mappedBy = "${fieldList.mappedBy}")
     <#else>
     @OneToMany
    </#if>
     private List<${fieldList.type.simpleName}> ${fieldList.name} ;
</#list>

     public ${pojo.name}(){
       super();
     }

<#list pojo.fields as field> 
<#if field.type.simpleName != "Boolean">
<#if field.list>
     public List<${field.type.simpleName}> get${field.name?cap_first}(){
          return this.${field.name};
     }
     
     <#else>
     public ${field.type.simpleName} get${field.name?cap_first}(){
          return this.${field.name};
     }
     </#if>
<#else>
    public ${field.type.simpleName} is${field.name?cap_first}(){
          return this.${field.name};
     }
</#if>
	<#if field.list>
      public void set${field.name?cap_first}(List<${field.type.simpleName}> ${field.name}){
          this.${field.name} = ${field.name};
     }
     
     <#else>
     public void set${field.name?cap_first}(${field.type.simpleName} ${field.name}){
          this.${field.name} = ${field.name};
     }
     </#if>
</#list>



}

