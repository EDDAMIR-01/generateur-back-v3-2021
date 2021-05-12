package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.converter};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceUtil}.*;

  
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name}; 
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;

@Component 
public class ${pojo.name}Converter extends AbstractConverter<${pojo.name},${pojo.name}Vo>{ 
	
    <#list pojo.types as type>
       <#if pojo.name != type.simpleName>
	   @Autowired
         private ${type.simpleName}Converter ${type.simpleName?uncap_first}Converter ;
       </#if>
    </#list>
   <#list pojo.fieldsGeneric as fieldGeneric>
    private Boolean ${fieldGeneric.name};
    </#list>
	<#list pojo.fieldsList as fieldList> 
    private Boolean ${fieldList.name};
    </#list>

	public  ${pojo.name}Converter(){
		init(true);
	}

	@Override 
 	public ${pojo.name} toItem(${pojo.name}Vo vo) {
 	if (vo == null) {
   	 return null;
      } else {
      	${pojo.name} item = new ${pojo.name}();
		  <#list pojo.fieldsSimple as fieldSimple>
              <#if fieldSimple.type.simpleName == "Double"  >
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(NumberUtil.toDouble(vo.get${fieldSimple.name?cap_first}()));
			   <#elseif fieldSimple.type.simpleName == "BigDecimal">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(NumberUtil.toBigDecimal(vo.get${fieldSimple.name?cap_first}()));
             <#elseif fieldSimple.type.simpleName == "Long">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(NumberUtil.toLong(vo.get${fieldSimple.name?cap_first}()));
			  <#elseif fieldSimple.type.simpleName == "Integer">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(NumberUtil.toInt(vo.get${fieldSimple.name?cap_first}()));
			 <#elseif fieldSimple.type.simpleName == "String">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(vo.get${fieldSimple.name?cap_first}());
             <#elseif fieldSimple.type.simpleName == "Boolean" || fieldSimple.type.simpleName == "boolean">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(NumberUtil.toBoolean(vo.get${fieldSimple.name?cap_first}()));
			 <#elseif fieldSimple.type.simpleName == "Date">
             if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
			      item.set${fieldSimple.name?cap_first}(DateUtil.parse(vo.get${fieldSimple.name?cap_first}()));
			 <#else>
			 if(vo.get${fieldSimple.name?cap_first}()!=null)
			      item.set${fieldSimple.name?cap_first}(vo.get${fieldSimple.name?cap_first}());
			</#if>
          </#list>
   <#list pojo.fieldsGeneric as fieldGeneric>
             if(vo.get${fieldGeneric.name?cap_first}Vo()!=null && this.${fieldGeneric.name})
			 <#if pojo.name != fieldGeneric.pojo.name>
			     item.set${fieldGeneric.name?cap_first}(${fieldGeneric.type.simpleName?uncap_first}Converter.toItem(vo.get${fieldGeneric.name?cap_first}Vo())) ;
				<#else>
			     item.set${fieldGeneric.name?cap_first}(toItem(vo.get${fieldGeneric.name?cap_first}Vo())) ;
				</#if>
    </#list>

	<#list pojo.fieldsList as fieldList> 
	         if(ListUtil.isNotEmpty(vo.get${fieldList.name?cap_first}Vo()) && this.${fieldList.name})
			  <#if pojo.name != fieldList.pojo.name>
                  item.set${fieldList.name?cap_first}(${fieldList.type.simpleName?uncap_first}Converter.toItem(vo.get${fieldList.name?cap_first}Vo()));
             <#else>
			     item.set${fieldList.name?cap_first}(toItem(vo.get${fieldList.name?cap_first}Vo()));
			</#if>


    </#list>

		return item;
 		}
 	}

 	 @Override 
 	public ${pojo.name}Vo toVo(${pojo.name} item) {
 		if (item == null) {
    		return null;
      	} else {
			${pojo.name}Vo vo = new ${pojo.name}Vo();

		  <#list pojo.fieldsSimple as fieldSimple>
		     <#if  fieldSimple.type.simpleName != "Boolean" && fieldSimple.type.simpleName != "boolean" && fieldSimple.type.simpleName != "Date" && fieldSimple.type.simpleName!="String">
			 if(item.get${fieldSimple.name?cap_first}()!=null)
				vo.set${fieldSimple.name?cap_first}(NumberUtil.toString(item.get${fieldSimple.name?cap_first}()));
			 <#elseif fieldSimple.type.simpleName == "Boolean" ||  fieldSimple.type.simpleName == "boolean">
			if(item.is${fieldSimple.name?cap_first}()!=null)
				vo.set${fieldSimple.name?cap_first}(NumberUtil.toString(item.is${fieldSimple.name?cap_first}()));
			 <#elseif fieldSimple.type.simpleName == "String" >
			if(StringUtil.isNotEmpty(item.get${fieldSimple.name?cap_first}()))
				vo.set${fieldSimple.name?cap_first}(item.get${fieldSimple.name?cap_first}());
			
			<#elseif fieldSimple.type.simpleName == "Date" >
            if(item.get${fieldSimple.name?cap_first}()!=null)
			    vo.set${fieldSimple.name?cap_first}(DateUtil.formateDate(item.get${fieldSimple.name?cap_first}()));	     
			<#else >

			if(item.get${fieldSimple.name?cap_first}()!=null)
				vo.set${fieldSimple.name?cap_first}(item.get${fieldSimple.name?cap_first}());
			 </#if>
          </#list>
   <#list pojo.fieldsGeneric as fieldGeneric>
            if(item.get${fieldGeneric.name?cap_first}()!=null && this.${fieldGeneric.name}) {
			 <#if pojo.name != fieldGeneric.pojo.name>
				<#list fieldGeneric.pojo.fields as fieldsGenericOfThisField>
			     <#if fieldsGenericOfThisField.generic && fieldsGenericOfThisField.pojo.name == pojo.name>
                ${fieldGeneric.type.simpleName?uncap_first}Converter.set${fieldsGenericOfThisField.name?cap_first}(false);
				 </#if>
				</#list>
				   vo.set${fieldGeneric.name?cap_first}Vo(${fieldGeneric.type.simpleName?uncap_first}Converter.toVo(item.get${fieldGeneric.name?cap_first}())) ;
				<#list fieldGeneric.pojo.fields as fieldsGenericOfThisField>
			     <#if fieldsGenericOfThisField.generic && fieldsGenericOfThisField.pojo.name == pojo.name>
                ${fieldGeneric.type.simpleName?uncap_first}Converter.set${fieldsGenericOfThisField.name?cap_first}(true);
				 </#if>
				</#list>
				<#else>
					<#list fieldGeneric.pojo.fields as fieldsGenericOfThisField>
					<#if fieldsGenericOfThisField.generic && fieldsGenericOfThisField.pojo.name == pojo.name>
					this.set${fieldsGenericOfThisField.name?cap_first}(false);
					</#if>
					</#list>
					vo.set${fieldGeneric.name?cap_first}Vo(toVo(item.get${fieldGeneric.name?cap_first}())) ;
					<#list fieldGeneric.pojo.fields as fieldsGenericOfThisField>
					<#if fieldsGenericOfThisField.generic && fieldsGenericOfThisField.pojo.name == pojo.name>
					this.set${fieldsGenericOfThisField.name?cap_first}(true);
					</#if>
					</#list>	
				</#if>
			   } 
    </#list>
	<#list pojo.fieldsList as fieldList> 
	         if(ListUtil.isNotEmpty(item.get${fieldList.name?cap_first}()) && this.${fieldList.name}){
				
				 ${fieldList.type.simpleName?uncap_first}Converter.init(false);
                vo.set${fieldList.name?cap_first}Vo(${fieldList.type.simpleName?uncap_first}Converter.toVo(item.get${fieldList.name?cap_first}()));
              	 ${fieldList.type.simpleName?uncap_first}Converter.init(true);
			 }
    </#list>

 			return vo;
 
 		}
 	}
	public void init(Boolean value) { 
	<#list pojo.fieldsGeneric as fieldGeneric>
       ${fieldGeneric.name} = value;
    </#list>
	<#list pojo.fieldsList as fieldList> 
       ${fieldList.name} = value;
    </#list>
	}


	

	
      <#list pojo.types as type>
       <#if pojo.name != type.simpleName>
	   public ${type.simpleName}Converter get${type.simpleName}Converter(){
		return this.${type.simpleName?uncap_first}Converter;
	}  
        public void set${type.simpleName}Converter(${type.simpleName}Converter ${type.simpleName?uncap_first}Converter ){
		 this.${type.simpleName?uncap_first}Converter = ${type.simpleName?uncap_first}Converter;
	}  
       </#if>
    </#list>
	
    <#list pojo.fieldsGeneric as fieldGeneric>
	 public boolean  is${fieldGeneric.name?cap_first}(){
		  return this.${fieldGeneric.name};
	 }
	 public void  set${fieldGeneric.name?cap_first}(boolean ${fieldGeneric.name}){
		   this.${fieldGeneric.name} = ${fieldGeneric.name};
	 }
    </#list>
	<#list pojo.fieldsList as fieldList> 
       public Boolean  is${fieldList.name?cap_first}(){
		 return this.${fieldList.name} ;
	   }
		 public void  set${fieldList.name?cap_first}(Boolean ${fieldList.name} ){
            this.${fieldList.name}  = ${fieldList.name} ;
		 }
    </#list>
}