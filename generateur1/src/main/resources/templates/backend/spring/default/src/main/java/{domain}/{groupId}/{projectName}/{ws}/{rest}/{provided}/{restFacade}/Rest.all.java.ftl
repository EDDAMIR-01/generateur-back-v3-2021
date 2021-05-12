package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.restFacade};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name}; 
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.${pojo.name}Service;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.converter}.${pojo.name?cap_first}Converter;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;

@Api("Manages ${pojo.name?uncap_first} services")
@RestController
@RequestMapping("${config.projectName}/${pojo.name?uncap_first}")
public class ${pojo.name}Rest {

	@Autowired 
	private ${pojo.name}Service ${pojo.name?uncap_first}Service;
	
	@Autowired 
	private ${pojo.name}Converter ${pojo.name?uncap_first}Converter ;

    @ApiOperation("Saves the specified ${pojo.name?uncap_first}")
	@PostMapping("/")
	public ${pojo.name}Vo save(@RequestBody ${pojo.name}Vo ${pojo.name?uncap_first}Vo){
		${pojo.name} ${pojo.name?uncap_first}= ${pojo.name?uncap_first}Converter.toItem(${pojo.name?uncap_first}Vo);
	  ${pojo.name?uncap_first}=	${pojo.name?uncap_first}Service.save(${pojo.name?uncap_first});
		return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first});
	}

    @ApiOperation("Delete the specified ${pojo.name?uncap_first}")
	@DeleteMapping("/")
	public int delete(@RequestBody ${pojo.name}Vo ${pojo.name?uncap_first}Vo){
		${pojo.name} ${pojo.name?uncap_first} = ${pojo.name?uncap_first}Converter.toItem(${pojo.name?uncap_first}Vo);
		return ${pojo.name?uncap_first}Service.delete(${pojo.name?uncap_first});
	}

	@ApiOperation("Updates the specified ${pojo.name?uncap_first}")
	@PutMapping("/")
	public ${pojo.name}Vo update(@RequestBody ${pojo.name}Vo ${pojo.name?uncap_first}Vo){
		${pojo.name} ${pojo.name?uncap_first}= ${pojo.name?uncap_first}Converter.toItem(${pojo.name?uncap_first}Vo);
	  ${pojo.name?uncap_first}=	${pojo.name?uncap_first}Service.update(${pojo.name?uncap_first});
		return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first});
	}

	@ApiOperation("Finds a list of all ${pojo.name?uncap_first}s")
	@GetMapping("/")
	public List<${pojo.name}Vo> findAll(){
		return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findAll());
	}
    
	@ApiOperation("Finds a ${pojo.name?uncap_first} by ${pojo.id.name}")
	@GetMapping("/${pojo.id.name}/{${pojo.id.name}}")
	public ${pojo.name}Vo findBy${pojo.id.name?cap_first}(@PathVariable ${pojo.id.type.simpleName} ${pojo.id.name}){
		return  ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findBy${pojo.id.name?cap_first}(${pojo.id.name}));
	}
	@ApiOperation("Deletes a ${pojo.name?uncap_first} by ${pojo.id.name}")
	@DeleteMapping("/${pojo.id.name}/{${pojo.id.name}}")
	public void deleteBy${pojo.id.name?cap_first}(@PathVariable ${pojo.id.type.simpleName} ${pojo.id.name}){
		 ${pojo.name?uncap_first}Service.deleteBy${pojo.id.name?cap_first}(${pojo.id.name});
	}

    <#if pojo.reference??>
	@ApiOperation("Finds a  ${pojo.name?uncap_first} by ${pojo.reference.name}")
    @GetMapping("/${pojo.reference.name}/{${pojo.reference.name}}")
	public ${pojo.name}Vo findBy${pojo.reference.name?cap_first}(@PathVariable ${pojo.reference.type.simpleName} ${pojo.reference.name}){
		return  ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findBy${pojo.reference.name?cap_first}(${pojo.reference.name}));
	}
	@ApiOperation("Deletes a  ${pojo.name?uncap_first} by ${pojo.reference.name}")
    @DeleteMapping("/${pojo.reference.name}/{${pojo.reference.name}}")
	public int deleteBy${pojo.reference.name?cap_first}(@PathVariable ${pojo.reference.type.simpleName} ${pojo.reference.name}){
		return  ${pojo.name?uncap_first}Service.deleteBy${pojo.reference.name?cap_first}(${pojo.reference.name});
	}
	
	</#if>


   <#list pojo.fieldsGeneric as fieldGeneric>
 	<#if fieldGeneric.pojo.reference??> 
    @ApiOperation("Finds a ${pojo.name?uncap_first} by ${fieldGeneric.pojo.reference.name} of ${fieldGeneric.name}")
	@GetMapping("/${fieldGeneric.name}/${fieldGeneric.pojo.reference.name}/{${fieldGeneric.pojo.reference.name}}")
	public List<${pojo.name}Vo> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(@PathVariable ${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name}){
		return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.name}));
	}
	
	@ApiOperation("Deletes a ${pojo.name?uncap_first} by ${fieldGeneric.pojo.reference.name} of ${fieldGeneric.name}")
	@DeleteMapping("/${fieldGeneric.name}/${fieldGeneric.pojo.reference.name}/{${fieldGeneric.pojo.reference.name}}")
	public int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(@PathVariable ${fieldGeneric.pojo.reference.type.simpleName} ${fieldGeneric.pojo.reference.name}){
		return ${pojo.name?uncap_first}Service.deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.reference.name?cap_first}(${fieldGeneric.pojo.reference.name});
	}
	</#if>
	
	@ApiOperation("Finds ${pojo.name?uncap_first} by ${fieldGeneric.pojo.id.name} of ${fieldGeneric.name}")
	@GetMapping("/${fieldGeneric.name}/${fieldGeneric.pojo.id.name}/{${fieldGeneric.pojo.id.name}}")
	public List<${pojo.name}Vo> findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(@PathVariable ${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name}){
		return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.name}));
	}
	@ApiOperation("Deletes ${pojo.name?uncap_first} by ${fieldGeneric.pojo.id.name} of ${fieldGeneric.name}")
	@DeleteMapping("/${fieldGeneric.name}/${fieldGeneric.pojo.id.name}/{${fieldGeneric.pojo.id.name}}")
	public int deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(@PathVariable ${fieldGeneric.pojo.id.type.simpleName} ${fieldGeneric.pojo.id.name}){
		return ${pojo.name?uncap_first}Service.deleteBy${fieldGeneric.name?cap_first}${fieldGeneric.pojo.id.name?cap_first}(${fieldGeneric.pojo.id.name});
	}
     	
		</#list>
   
    @ApiOperation("Search ${pojo.name?uncap_first} by a specific criterion")
    @PostMapping("/search")
	public List<${pojo.name}Vo> findByCriteria(@RequestBody ${pojo.name}Vo ${pojo.name?uncap_first}Vo){
       return ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findByCriteria(${pojo.name?uncap_first}Vo));
	}	
	public ${pojo.name}Converter get${pojo.name}Converter(){
		return ${pojo.name?uncap_first}Converter;
	}
 
	public void set${pojo.name}Converter(${pojo.name}Converter ${pojo.name?uncap_first}Converter){
		this.${pojo.name?uncap_first}Converter=${pojo.name?uncap_first}Converter;
	}

	public ${pojo.name}Service get${pojo.name}Service(){
		return ${pojo.name?uncap_first}Service;
	}
	public void set${pojo.name}Service( ${pojo.name}Service ${pojo.name?uncap_first}Service){
	 	this.${pojo.name?uncap_first}Service=${pojo.name?uncap_first}Service;
	}
	

}