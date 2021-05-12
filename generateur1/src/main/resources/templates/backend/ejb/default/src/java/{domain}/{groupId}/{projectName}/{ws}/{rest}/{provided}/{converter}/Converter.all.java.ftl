package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.converter};

import javax.ejb.EJB;
import javax.ejb.Stateless;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceUtil}.*;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name}; 
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;

@Stateless 
public class ${pojo.name}Converter extends AbstractConverter<${pojo.name},${pojo.name}Vo>{ 
   <#list pojo.fieldsGeneric as fieldGeneric>
    @EJB
    private ${fieldGeneric.type.simpleName}Converter ${fieldGeneric.type.simpleName?uncap_first}Converter ;
    private boolean  ${fieldGeneric.name};
    </#list>
	<#list pojo.fieldsList as fieldList> 
    @EJB
    private ${fieldList.type.simpleName}Converter ${fieldList.type.simpleName?uncap_first}Converter ;
    private boolean ${fieldList.name};
    </#list>

	
	public  ${pojo.name}Converter(){
		init(false);
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
			 <#elseif fieldSimple.type.simpleName == "String">
			 if(StringUtil.isNotEmpty(vo.get${fieldSimple.name?cap_first}()))
                  item.set${fieldSimple.name?cap_first}(vo.get${fieldSimple.name?cap_first}());
             <#elseif fieldSimple.type.simpleName == "Boolean">
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
            if(item.get${fieldGeneric.name?cap_first}()!=null && this.${fieldGeneric.name}) {
				    ${fieldGeneric.type.simpleName?uncap_first}Converter.init(false);
				   vo.set${fieldGeneric.name?cap_first}Vo(${fieldGeneric.type.simpleName?uncap_first}Converter.toVo(item.get${fieldGeneric.name?cap_first}())) ;
			        ${fieldGeneric.type.simpleName?uncap_first}Converter.init(true);
			   } 
    </#list>
	<#list pojo.fieldsList as fieldList> 
	         if(ListUtil.isNotEmpty(item.get${fieldList.name?cap_first}()) && this.${fieldList.name}){
				 ${fieldList.type.simpleName?uncap_first}Converter.init(false);
                vo.set${fieldList.name?cap_first}Vo(${fieldList.type.simpleName?uncap_first}Converter.toVo(item.get${fieldList.name?cap_first}()));
              	 ${fieldList.type.simpleName?uncap_first}Converter.init(true);
			 }
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
		     <#if  fieldSimple.type.simpleName != "Boolean" && fieldSimple.type.simpleName != "Date" && fieldSimple.type.simpleName!="String">
			 if(item.get${fieldSimple.name?cap_first}()!=null)
				vo.set${fieldSimple.name?cap_first}(NumberUtil.toString(item.get${fieldSimple.name?cap_first}()));
			 <#elseif fieldSimple.type.simpleName == "Boolean" >
			     
				vo.set${fieldSimple.name?cap_first}(item.is${fieldSimple.name?cap_first}());
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
            if(item.get${fieldGeneric.name?cap_first}()!=null && this.${fieldGeneric.name})
	            vo.set${fieldGeneric.name?cap_first}Vo(${fieldGeneric.type.simpleName?uncap_first}Converter.toVo(item.get${fieldGeneric.name?cap_first}())) ;
    </#list>
	<#list pojo.fieldsList as fieldList> 
	         if(ListUtil.isNotEmpty(item.get${fieldList.name?cap_first}()) && this.${fieldList.name})
                vo.set${fieldList.name?cap_first}Vo(${fieldList.type.simpleName?uncap_first}Converter.toVo(item.get${fieldList.name?cap_first}()));
    </#list>

 			return vo;
 
 		}
 	}
	public void init(boolean value) { 
	<#list pojo.fieldsGeneric as fieldGeneric>
       ${fieldGeneric.name} = value;
    </#list>
	<#list pojo.fieldsList as fieldList> 
       ${fieldList.name} = value;
    </#list>
	}


	 <#list pojo.fieldsGeneric as fieldGeneric>

	public ${fieldGeneric.type.simpleName}Converter get${fieldGeneric.type.simpleName}Converter(){
		return this.${fieldGeneric.type.simpleName?uncap_first}Converter;
	}  
    public void set${fieldGeneric.type.simpleName}Converter(${fieldGeneric.type.simpleName}Converter ${fieldGeneric.type.simpleName?uncap_first}Converter ){
		 this.${fieldGeneric.type.simpleName?uncap_first}Converter = ${fieldGeneric.type.simpleName?uncap_first}Converter;
	}  
	 public boolean  is${fieldGeneric.name?cap_first}(){
		  return this.${fieldGeneric.name};
	 }
	 public void  set${fieldGeneric.name?cap_first}(boolean ${fieldGeneric.name}){
		   this.${fieldGeneric.name} = ${fieldGeneric.name};
	 }
    </#list>
	<#list pojo.fieldsList as fieldList> 
       public boolean  is${fieldList.name?cap_first}(){
		 return this.${fieldList.name} ;
	   }
		 public void  set${fieldList.name?cap_first}(boolean ${fieldList.name} ){
            this.${fieldList.name}  = ${fieldList.name} ;
		 }
    </#list>
}