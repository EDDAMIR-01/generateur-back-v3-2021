package ${config.domain}.${config.groupId}.${config.projectName}.${config.dao};

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name};


@Repository
public interface ${pojo.name}Dao extends JpaRepository<${pojo.name},${pojo.id.type.simpleName}> {

<#if pojo.reference??>
	${pojo.name} findBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName} ${pojo.reference.name});
       int deleteBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName} ${pojo.reference.name});
</#if>

<#list pojo.fieldsGeneric as fieldGeneric> 
 <#if fieldGeneric.pojo.reference??>
       List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name});
       int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name});       
       </#if>
       List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name});
       int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name});
</#list>

}