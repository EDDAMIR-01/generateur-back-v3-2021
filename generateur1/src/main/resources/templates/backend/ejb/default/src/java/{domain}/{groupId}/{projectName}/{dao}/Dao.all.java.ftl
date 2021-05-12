
package  ${config.domain}.${config.groupId}.${config.projectName}.${config.dao};

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${pojo.name};

@Stateless
public class ${pojo.name}Dao extends AbstractDao<${pojo.name}> {

    @PersistenceContext(unitName = "WebApplication1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ${pojo.name}Dao() {
        super(${pojo.name}.class);
    }
    
}
