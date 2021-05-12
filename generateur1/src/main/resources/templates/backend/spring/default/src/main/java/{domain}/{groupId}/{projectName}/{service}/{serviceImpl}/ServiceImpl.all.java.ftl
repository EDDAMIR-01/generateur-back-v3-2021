package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceImpl};

import java.util.List;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.stereotype.Service;
import javax.persistence.EntityManager;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name};
<#list pojo.fieldsGeneric as fieldGeneric>
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${fieldGeneric.pojo.name};
</#list>
<#list pojo.fieldsList as fieldList>
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${fieldList.pojo.name};
</#list>
import ${config.domain}.${config.groupId}.${config.projectName}.${config.dao}.${pojo.name}Dao;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.${pojo.name}Service;
  <#list pojo.types as type>
   <#if pojo.name != type.simpleName>
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.${type.simpleName}Service;   
   </#if>
</#list>

import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceUtil}.*;
@Service
public class ${pojo.name}ServiceImpl implements ${pojo.name}Service {

   @Autowired
   private ${pojo.name}Dao ${pojo.name?uncap_first}Dao;
   
   <#list pojo.types as type>
   <#if pojo.name != type.simpleName>
    @Autowired
    private ${type.simpleName}Service ${type.simpleName?uncap_first}Service ;
   </#if>
   </#list>

   @Autowired 
   private EntityManager entityManager; 

	@Override
	public List<${pojo.name}> findAll(){
		return ${pojo.name?uncap_first}Dao.findAll();
	}	
		<#list pojo.fieldsGeneric as fieldGeneric>
			<#if fieldGeneric.pojo.reference??> 
	@Override
	public List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name}){
		return ${pojo.name?uncap_first}Dao.findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.name});
	}
	@Override
	@Transactional
    public int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name}){
		return ${pojo.name?uncap_first}Dao.deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.name});
	}
	
     		</#if>
     @Override
    public List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name}){
		return ${pojo.name?uncap_first}Dao.findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.name});

	}
	   @Override
	   @Transactional
    public int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name}){
		return ${pojo.name?uncap_first}Dao.deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.name});

	}
     		
		</#list>
<#if pojo.reference??>
	@Override
	public ${pojo.name} findBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName} ${pojo.reference.name}){
		if( ${pojo.reference.name}==null)
		  return null;
		return ${pojo.name?uncap_first}Dao.findBy${pojo.reference.name?cap_first}(${pojo.reference.name});
	}

   

	@Override
	@Transactional
	public int deleteBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName}  ${pojo.reference.name}) {
		return ${pojo.name?uncap_first}Dao.deleteBy${pojo.reference.name?cap_first}(${pojo.reference.name?uncap_first});	 
	}
</#if>

	@Override
	public ${pojo.name} findBy${pojo.id.name?cap_first}(${pojo.id.type.simpleName} ${pojo.id.name}){
		 if(${pojo.id.name}==null)
		  return null;
		return ${pojo.name?uncap_first}Dao.getOne(${pojo.id.name});
	}
    
	@Transactional
   public void deleteBy${pojo.id.name?cap_first}(${pojo.id.type.simpleName} ${pojo.id.name}){
           ${pojo.name?uncap_first}Dao.deleteBy${pojo.id.name?cap_first}(${pojo.id.name});
   }
	@Override	
	public ${pojo.name} save (${pojo.name} ${pojo.name?uncap_first}){
	   <#if pojo.reference??>   
			${pojo.name} founded${pojo.name} = findBy${pojo.reference.name?cap_first}(${pojo.name?uncap_first}.get${pojo.reference.name?cap_first}());
	       if(founded${pojo.name}!=null)
	          return null;  
	   </#if>
       <#list pojo.fieldsGeneric as fieldGeneric>
	    
	          if(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}()!=null){
				  <#if fieldGeneric.pojo.reference??> 
				      <#if fieldGeneric.pojo.name != pojo.name>
				    ${fieldGeneric.pojo.name} ${fieldGeneric.name?uncap_first} = ${fieldGeneric.type.simpleName?uncap_first}Service.findBy${fieldGeneric.pojo.reference.name?cap_first}(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}().get${fieldGeneric.pojo.reference.name?cap_first}());
				      <#else>
                          ${fieldGeneric.pojo.name} ${fieldGeneric.name?uncap_first}  = findBy${fieldGeneric.pojo.reference.name?cap_first}(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}().get${fieldGeneric.pojo.reference.name?cap_first}());
					  </#if>
				   <#else>
				     <#if fieldGeneric.pojo.name != pojo.name>
                      ${fieldGeneric.pojo.name} ${fieldGeneric.name?uncap_first} = ${fieldGeneric.type.simpleName?uncap_first}Service.findBy${fieldGeneric.pojo.id.name?cap_first}(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}().get${fieldGeneric.pojo.id.name?cap_first}());
				      <#else>
                      ${fieldGeneric.pojo.name} ${fieldGeneric.name?uncap_first} = findBy${fieldGeneric.pojo.id.name?cap_first}(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}().get${fieldGeneric.pojo.id.name?cap_first}());
					  </#if>
				  
				  </#if>
				  if(${fieldGeneric.name?uncap_first} == null)
				   <#if fieldGeneric.pojo.name != pojo.name>
				  ${pojo.name?uncap_first}.set${fieldGeneric.name?cap_first}(${fieldGeneric.type.simpleName?uncap_first}Service.save(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}()));
                   <#else>
				   	 ${pojo.name?uncap_first}.set${fieldGeneric.name?cap_first}(save(${pojo.name?uncap_first}.get${fieldGeneric.name?cap_first}()));
				 </#if>
				  else
				  ${pojo.name?uncap_first}.set${fieldGeneric.name?cap_first}(${fieldGeneric.name?uncap_first});
			  }
	   </#list>

	    ${pojo.name} saved${pojo.name} = ${pojo.name?uncap_first}Dao.save(${pojo.name?uncap_first});
		 <#list pojo.fieldsList as fieldList>
           <#if fieldList.mappedBy??>
               if(ListUtil.isNotEmpty(${pojo.name?uncap_first}.get${fieldList.name?cap_first}())){
		     <#if fieldList.pojo.name != pojo.name>
		  saved${pojo.name}.set${fieldList.name?cap_first}(${fieldList.type.simpleName?uncap_first}Service.save(prepare${fieldList.name?cap_first}(saved${pojo.name},${pojo.name?uncap_first}.get${fieldList.name?cap_first}())));
            <#else>
			saved${pojo.name}.set${fieldList.name?cap_first}(save(prepare${fieldList.name?cap_first}(saved${pojo.name},${pojo.name?uncap_first}.get${fieldList.name?cap_first}())));

				 </#if>
		 }
           </#if>
      </#list> 
	   return saved${pojo.name};
	}

    @Override
    public List<${pojo.name}> save(List<${pojo.name}> ${pojo.name?uncap_first}s){
		List<${pojo.name}> list = new ArrayList<${pojo.name}>();
		for(${pojo.name} ${pojo.name?uncap_first}: ${pojo.name?uncap_first}s){
		        list.add(save(${pojo.name?uncap_first}));	
		}
		return list;
	}

	<#list pojo.fieldsList as fieldList>
	 <#if fieldList.mappedBy??>
     private List<${fieldList.pojo.name}> prepare${fieldList.name?cap_first}(${pojo.name} ${pojo.name?uncap_first},List<${fieldList.pojo.name}> ${fieldList.pojo.name?uncap_first}s){
		    for(${fieldList.pojo.name} ${fieldList.pojo.name?uncap_first}:${fieldList.pojo.name?uncap_first}s ){
                  ${fieldList.pojo.name?uncap_first}.set${fieldList.mappedBy?cap_first}(${pojo.name?uncap_first}); 
			}
			return ${fieldList.pojo.name?uncap_first}s;
	  }
	  </#if>
     </#list>

   @Override
   public ${pojo.name} update(${pojo.name?cap_first} ${pojo.name?uncap_first}){
     
    
		  ${pojo.name} founded${pojo.name} = findBy${pojo.id.name?cap_first}(${pojo.name?uncap_first}.get${pojo.id.name?cap_first}()); 
		       if(founded${pojo.name}==null)
	          return null;	  
	  
	   return  ${pojo.name?uncap_first}Dao.save(${pojo.name?uncap_first});
     
     }
    
	@Override
	@Transactional
	public int delete(${pojo.name?cap_first} ${pojo.name?uncap_first}){

		 <#if pojo.reference??>
	        if(${pojo.name?uncap_first}.get${pojo.reference.name?cap_first}()==null)
			  return -1;
		
			${pojo.name} founded${pojo.name} = findBy${pojo.reference.name?cap_first}(${pojo.name?uncap_first}.get${pojo.reference.name?cap_first}());
	       if(founded${pojo.name}==null)
	          return -1;  
		<#else>
		 if(${pojo.name?uncap_first}.get${pojo.id.name?cap_first}()==null)
			  return -1;
		  ${pojo.name} founded${pojo.name} = findBy${pojo.id.name?cap_first}(${pojo.name?uncap_first}.get${pojo.id.name?cap_first}()); 
		       if(founded${pojo.name}==null)
	          return -1;	  
	   </#if>
	   ${pojo.name?uncap_first}Dao.delete(founded${pojo.name});
	   return 1;
	}


	public List<${pojo.name}> findByCriteria(${pojo.name}Vo ${pojo.name?uncap_first}Vo){
      String query = "SELECT o FROM ${pojo.name} o where 1=1 ";
   <#list pojo.fieldsSimple as fieldSimple>
         <#if fieldSimple.type.simpleName != "Date">
		 <#if fieldSimple.type.simpleName != "String">
		 	 query += SearchUtil.addConstraint( "o", "${fieldSimple.name?uncap_first}","=",${pojo.name?uncap_first}Vo.get${fieldSimple.name?cap_first}());
		 	  <#else>
			 query += SearchUtil.addConstraint( "o", "${fieldSimple.name?uncap_first}","LIKE",${pojo.name?uncap_first}Vo.get${fieldSimple.name?cap_first}());

		 </#if>
	  <#else>
	  query += SearchUtil.addConstraintDate( "o", "${fieldSimple.name?uncap_first}","=",${pojo.name?uncap_first}Vo.get${fieldSimple.name?cap_first}());
          </#if>
   </#list>
    <#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
     <#if pojo.id.name != fieldSimpleNumberOrDate.name >
          <#if fieldSimpleNumberOrDate.type.simpleName != "Date">
	  query += SearchUtil.addConstraintMinMax("o","${fieldSimpleNumberOrDate.name}",${pojo.name?uncap_first}Vo.get${fieldSimpleNumberOrDate.name?cap_first}Min(),${pojo.name?uncap_first}Vo.get${fieldSimpleNumberOrDate.name?cap_first}Max());
	  <#else>
	  query += SearchUtil.addConstraintMinMaxDate("o","${fieldSimpleNumberOrDate.name}",${pojo.name?uncap_first}Vo.get${fieldSimpleNumberOrDate.name?cap_first}Min(),${pojo.name?uncap_first}Vo.get${fieldSimpleNumberOrDate.name?cap_first}Max());
          </#if>
     </#if>     
   </#list>
   <#list pojo.fieldsGeneric as fieldGeneric>
   if(${pojo.name?uncap_first}Vo.get${fieldGeneric.name?cap_first}Vo()!=null){
    <#if fieldGeneric.pojo.id.type.simpleName != "String">
     query += SearchUtil.addConstraint( "o", "${fieldGeneric.name?uncap_first}.${fieldGeneric.pojo.id.name}","=",${pojo.name?uncap_first}Vo.get${fieldGeneric.name?cap_first}Vo().get${fieldGeneric.pojo.id.name?cap_first}());
    <#else>
     query += SearchUtil.addConstraint( "o", "${fieldGeneric.name?uncap_first}.${fieldGeneric.pojo.id.name}","LIKE",${pojo.name?uncap_first}Vo.get${fieldGeneric.name?cap_first}Vo().get${fieldGeneric.pojo.id.name?cap_first}());
   </#if>
    <#if fieldGeneric.pojo.reference??>
	<#if fieldGeneric.pojo.reference.type.simpleName != "String">
     query += SearchUtil.addConstraint( "o", "${fieldGeneric.name?uncap_first}.${fieldGeneric.pojo.reference.name}","=",${pojo.name?uncap_first}Vo.get${fieldGeneric.name?cap_first}Vo().get${fieldGeneric.pojo.reference.name?cap_first}());
    <#else>
     query += SearchUtil.addConstraint( "o", "${fieldGeneric.name?uncap_first}.${fieldGeneric.pojo.reference.name}","LIKE",${pojo.name?uncap_first}Vo.get${fieldGeneric.name?cap_first}Vo().get${fieldGeneric.pojo.reference.name?cap_first}());
   </#if>
	</#if>
   }
   
    </#list>
	 return entityManager.createQuery(query).getResultList();
	}
	
 
}
