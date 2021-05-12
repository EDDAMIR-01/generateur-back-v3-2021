package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade};

import java.util.List;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name};
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;

public interface ${pojo.name}Service {

        /**

     * find all ${pojo.name} in database 
     * @return List<${pojo.name}> , If database is empty return  null.
     */
	List<${pojo.name}> findAll();
	   
		<#if pojo.reference??>
	/**

     * find ${pojo.name} from database by ${pojo.reference.name} (reference)
     * @param ${pojo.reference.name} - reference of ${pojo.name} 
     * @return the founded ${pojo.name} , If no ${pojo.name} were
     *         found in database return  null.
     */
	${pojo.name} findBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName} ${pojo.reference.name});
		</#if>

    /**
     * find ${pojo.name} from database by ${pojo.id.name} (id)
     * @param ${pojo.id.name} - id of ${pojo.name} 
     * @return the founded  ${pojo.name} , If no ${pojo.name} were
     *         found in database return  null.
     */
	${pojo.name} findBy${pojo.id.name?cap_first}(${pojo.id.type.simpleName} ${pojo.id.name});
     
     /**
     * delete ${pojo.name} from database
     * @param ${pojo.id.name} - id of ${pojo.name} to be deleted
     * 
     */
	void deleteBy${pojo.id.name?cap_first}(${pojo.id.type.simpleName} ${pojo.id.name});

			<#list pojo.fieldsGeneric as fieldGeneric>
			<#if fieldGeneric.pojo.reference??> 
	List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name});
    int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name});       
			
			 </#if>
    List<${pojo.name}> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name});
    int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name});
			 
		</#list>
    /**
     * save ${pojo.name} in database
     * @param ${pojo.name?uncap_first} - ${pojo.name} to be saved 
     * @return the saved ${pojo.name}, If the ${pojo.name} can't be saved return null.
     */
	${pojo.name} save(${pojo.name?cap_first} ${pojo.name?uncap_first});

	/**
     * save list ${pojo.name} in database
     * @param ${pojo.name?uncap_first}s - list of ${pojo.name} to be saved 
     * @return the saved ${pojo.name} list
     */
	List<${pojo.name}> save(List<${pojo.name}> ${pojo.name?uncap_first}s);
    
     /**
     * update ${pojo.name} in database
     * @param ${pojo.name?uncap_first} - ${pojo.name} to be updated
     * @return the updated ${pojo.name}, If the ${pojo.name} can't be updated return null.
     */
    ${pojo.name} update(${pojo.name?cap_first} ${pojo.name?uncap_first});
    
       /**
     * delete ${pojo.name} from database
     * @param ${pojo.name?uncap_first} - ${pojo.name} to be deleted
     * @return 1 if ${pojo.name} deleted successfully, If the ${pojo.name} can't be deleted return negative int
     */
	int delete(${pojo.name?cap_first} ${pojo.name?uncap_first});


    
		<#if pojo.reference??>
        /**
     * delete ${pojo.name} from database by ${pojo.reference.name} (reference)
     * 
     * @param ${pojo.reference.name} - reference of ${pojo.name} to be deleted
     * @return 1 if ${pojo.name} deleted successfully
     */
	int deleteBy${pojo.reference.name?cap_first}(${pojo.reference.type.simpleName} ${pojo.reference.name});
		</#if>

     
	/**
     * search for ${pojo.name} in by some criteria
     * @return the searhed list ${pojo.name} 
     */
	List<${pojo.name}> findByCriteria( ${pojo.name}Vo ${pojo.name?uncap_first}Vo);
}