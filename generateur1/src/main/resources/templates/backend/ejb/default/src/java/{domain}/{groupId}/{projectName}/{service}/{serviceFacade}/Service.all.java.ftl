package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade};


import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name};
import ${config.domain}.${config.groupId}.${config.projectName}.${config.dao}.${pojo.name}Dao;


@Stateless
public class ${pojo.name}Service{
    @EJB
    private ${pojo.name}Dao ${pojo.name?uncap_first}Dao;

    public void create(${pojo.name} entity) {
        ${pojo.name?uncap_first}Dao.create(entity);
    }

    public void edit(${pojo.name} entity) {
        ${pojo.name?uncap_first}Dao.edit(entity);
    }

    public void remove(${pojo.name} entity) {
        ${pojo.name?uncap_first}Dao.remove(entity);
    }

    public ${pojo.name} find(Object id) {
        return ${pojo.name?uncap_first}Dao.find(id);
    }

    public List<${pojo.name}> findAll() {
        return ${pojo.name?uncap_first}Dao.findAll();
    }

    public List<${pojo.name}> findRange(int[] range) {
        return ${pojo.name?uncap_first}Dao.findRange(range);
    }

    public int count() {
        return ${pojo.name?uncap_first}Dao.count();
    }
}
