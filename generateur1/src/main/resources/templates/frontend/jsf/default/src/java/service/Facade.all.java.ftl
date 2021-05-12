/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package service;

import bean.${pojo.name};
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
*
* @author Ultrapc
*/
@Stateless
public class ${pojo.name}Facade extends AbstractFacade<${pojo.name}> {

    @PersistenceContext(unitName = "GeneratedJsfPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
    return em;
    }

    public ${pojo.name}Facade() {
    super(${pojo.name}.class);
    }

    }
