package ma.zs.generator.project.service.facade;

import java.util.List;

import ma.zs.generator.helper.config.enumeration.CATEGORY;
import ma.zs.generator.project.bean.Technologie;

/**
 * @author Qada
 *
 */
public interface TechnologieService {
	
	 Technologie findByName(String name);
	 int save(Technologie technologie);
     List<Technologie> findByCategory(CATEGORY category);
     List<Technologie> findAll();
     int deleteByName(String name);
     
     
}
