package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo};

<#if pojo.hasList>
import java.util.List;
</#if>
<#if pojo.hasDate>
import java.util.Date;
</#if>
<#if pojo.hasBigDecimal>
import java.math.BigDecimal;   
</#if>

public class ${pojo.name}Vo {

<#list pojo.fieldsSimple as fieldSimple>
     private String ${fieldSimple.name} ;
   
</#list>

<#list pojo.fieldsGeneric as fieldGeneric>
	private ${fieldGeneric.type.simpleName}Vo ${fieldGeneric.name}Vo ;
</#list>

<#list pojo.fieldsList as fieldGenericList> 
     private List<${fieldGenericList.type.simpleName}Vo> ${fieldGenericList.name}Vo ;
</#list>

<#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
    <#if pojo.id.name != fieldSimpleNumberOrDate.name>
     private String ${fieldSimpleNumberOrDate.name}Max ;
     private String ${fieldSimpleNumberOrDate.name}Min ;
    </#if>
</#list>

 public ${pojo.name}Vo(){
       super();
     }

<#list pojo.fieldsSimple as fieldSimple>

     public String get${fieldSimple.name?cap_first}(){
          return this.${fieldSimple.name};
     }
      public void set${fieldSimple.name?cap_first}(String ${fieldSimple.name}){
          this.${fieldSimple.name} = ${fieldSimple.name};
     }

</#list>

<#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
     <#if pojo.id.name != fieldSimpleNumberOrDate.name >

      public String get${fieldSimpleNumberOrDate.name?cap_first}Max(){
          return this.${fieldSimpleNumberOrDate.name}Max;
     }
     
      public String get${fieldSimpleNumberOrDate.name?cap_first}Min(){
          return this.${fieldSimpleNumberOrDate.name}Min;
     }

     public void set${fieldSimpleNumberOrDate.name?cap_first}Max(String ${fieldSimpleNumberOrDate.name}Max){
          this.${fieldSimpleNumberOrDate.name}Max = ${fieldSimpleNumberOrDate.name}Max;
     }

     public void set${fieldSimpleNumberOrDate.name?cap_first}Min(String ${fieldSimpleNumberOrDate.name}Min){
          this.${fieldSimpleNumberOrDate.name}Min = ${fieldSimpleNumberOrDate.name}Min;
     }
     
     </#if>
     
	</#list>

<#list pojo.fieldsGeneric as fieldGeneric>
      public ${fieldGeneric.type.simpleName}Vo get${fieldGeneric.name?cap_first}Vo(){
          return this.${fieldGeneric.name}Vo;
     }
       
     public void set${fieldGeneric.name?cap_first}Vo(${fieldGeneric.type.simpleName}Vo ${fieldGeneric.name}Vo){
          this.${fieldGeneric.name}Vo = ${fieldGeneric.name}Vo;
     }
   
</#list>

<#list pojo.fieldsList as fieldGenericList> 
      public List<${fieldGenericList.type.simpleName}Vo> get${fieldGenericList.name?cap_first}Vo(){
          return this.${fieldGenericList.name}Vo;
     }
       
     public void set${fieldGenericList.name?cap_first}Vo(List<${fieldGenericList.type.simpleName}Vo> ${fieldGenericList.name}Vo){
          this.${fieldGenericList.name}Vo = ${fieldGenericList.name}Vo;
     }
</#list>



}