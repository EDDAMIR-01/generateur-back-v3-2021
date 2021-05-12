package ma.zs.generator.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.zs.generator.helper.config.enumeration.CATEGORY;
import ma.zs.generator.project.bean.ProjectTemplate;

/**
 * @author Qada
 *
 */
@Repository
public interface ProjectTemplateDao extends JpaRepository<ProjectTemplate, Long>{
 
	ProjectTemplate findByNameAndTechnologieName(String templateName,String technologieName);
    List<ProjectTemplate> findByTechnologieCategory(CATEGORY category);
    List<ProjectTemplate> findByTechnologieName(String name);
    }
