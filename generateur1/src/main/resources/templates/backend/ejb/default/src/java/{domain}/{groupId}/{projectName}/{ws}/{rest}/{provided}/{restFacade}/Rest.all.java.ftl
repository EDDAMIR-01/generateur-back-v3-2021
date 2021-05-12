package ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.restFacade};

import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name}; 
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.${pojo.name}Service;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.converter}.${pojo.name?cap_first}Converter;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${pojo.name}Vo;


@Stateless
@Path("${config.projectName}/${pojo.name?uncap_first}")
public class ${pojo.name}Rest {

	@EJB 
	private ${pojo.name}Service ${pojo.name?uncap_first}Service;
	
	@EJB 
	private ${pojo.name}Converter ${pojo.name?uncap_first}Converter ;

    @POST
    @Path("/")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(${pojo.name}Vo entity) {
         ${pojo.name?uncap_first}Service.create(${pojo.name?uncap_first}Converter.toItem(entity));
    }

    @PUT
    @Path("/")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(${pojo.name}Vo entity) {
         ${pojo.name?uncap_first}Service.edit(${pojo.name?uncap_first}Converter.toItem(entity));
    }

    @DELETE
    @Path("/{id}")
    public void remove(@PathParam("id") Long id) {
        ${pojo.name?uncap_first}Service.remove(${pojo.name?uncap_first}Service.find(id));
    }

    @GET
    @Path("/{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public ${pojo.name}Vo find(@PathParam("id") Long id) {
        return  ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.find(id));
    }

    @GET
    @Path("/")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<${pojo.name}Vo> findAll() {
        return  ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findAll());
    }

    @GET
    @Path("/{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<${pojo.name}Vo> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return  ${pojo.name?uncap_first}Converter.toVo(${pojo.name?uncap_first}Service.findRange(new int[]{from, to}));
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf( ${pojo.name?uncap_first}Service.count());
    }
	

}