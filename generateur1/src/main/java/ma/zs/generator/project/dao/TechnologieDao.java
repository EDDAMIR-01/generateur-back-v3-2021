package ma.zs.generator.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.zs.generator.helper.config.enumeration.CATEGORY;
import ma.zs.generator.project.bean.Technologie;

/**
 * @author Qada
 *
 */
@Repository
public interface TechnologieDao  extends JpaRepository<Technologie, Long>{

       Technologie findByName(String name);
       List<Technologie> findByCategory(CATEGORY category);
}
