/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.zs.generator.helper.pojo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.zs.generator.helper.pojo.bean.PojoConfig;


/**
 *
 * @author mac
 */
@Repository
public interface PojoConfigDao extends JpaRepository<PojoConfig , Long> {
}
