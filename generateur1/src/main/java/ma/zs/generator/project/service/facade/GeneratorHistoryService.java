package ma.zs.generator.project.service.facade;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import ma.zs.generator.project.bean.GeneratorHistory;
import ma.zs.generator.project.bean.ProjectTemplate;

/**
 * @author Qada
 *
 */
public interface GeneratorHistoryService {
	Long countAll();

	List<GeneratorHistory> findAll();
	void save(ProjectTemplate projectTemplate);
	
//	Long generatedToday();
//	Long generatedThisDate(Date date);
//	Long allGeneratedLastWeek();
//	Long ThisGeneratedLastWeek(ProjectTemplate projectTemplate);
//	Long thisGeneratedAllTime(ProjectTemplate projectTemplate);
//	 Long thisGeneratedInThisDate(ProjectTemplate projectTemplate,Date date);

	HashMap<String, Object> statistics();

	HashMap<String, Object> statisticsOfTechnologie(String name);
}
