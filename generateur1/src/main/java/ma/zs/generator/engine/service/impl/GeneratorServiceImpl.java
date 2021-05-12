package ma.zs.generator.engine.service.impl;

import java.io.File;
import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import freemarker.template.TemplateException;
import ma.zs.generator.engine.bean.FileEngineConfig;
import ma.zs.generator.engine.service.facade.FileEngine;
import ma.zs.generator.engine.service.facade.GeneratorService;
import ma.zs.generator.engine.service.facade.ProjectTemplateLoader;
import ma.zs.generator.engine.service.facade.TemplateEngineService;
import ma.zs.generator.engine.service.util.FileUtil;
import ma.zs.generator.engine.service.util.ZipUtil;

import ma.zs.generator.helper.pojo.service.facade.PojoService;
import ma.zs.generator.helper.pojo.service.reader.facade.PojoReader;
import ma.zs.generator.project.bean.GeneratedProject;
import ma.zs.generator.project.bean.ProjectTemplate;
import ma.zs.generator.project.bean.Technologie;
import ma.zs.generator.project.config.UserConfig;
import ma.zs.generator.project.service.facade.GeneratorHistoryService;
import ma.zs.generator.project.service.facade.ProjectTemplateService;
import ma.zs.generator.project.service.facade.TechnologieService;

/**
 * @author Qada
 *
 */
@Service
public class GeneratorServiceImpl implements GeneratorService {

	@Autowired
	private PojoService pojoService;
	@Autowired
	private ProjectTemplateService projectTemplateService;
	@Autowired
	private ProjectTemplateLoader templateLoader;
	@Autowired
	private TemplateEngineService templateEngine;
	@Autowired 
	private TechnologieService technologieService;
	@Autowired
	private FileEngine fileEngine;
    @Autowired
	private GeneratorHistoryService history;
    @Autowired
    @Qualifier("yamlReader")
	private PojoReader yamlService;
	private String generatedProjectFolder = System.getProperty("user.home") + "\\generated";

	@Override
	public GeneratedProject generate(UserConfig userConfig) {
		if (userConfig.getPojos() == null || userConfig.getPojos().size() == 0)
			return null;
		userConfig.setPojos(pojoService.validatePojos(userConfig.getPojos()));
		if (userConfig.getPojos().size() == 0)
			return null;

		try {
             File generatedProject = new File(generatedProjectFolder);
             if(generatedProject.exists())
			 System.out.println(FileUtil.deleteDirectory(generatedProject));
			if (userConfig.isWantBackend()) {

				generateBackend(userConfig);
			}
			if (userConfig.isWantFrontend()) {
				generateFrontend(userConfig);
			}

		} catch (IOException e) {
			System.out.println("errora fi dakchi dfiles");
			e.printStackTrace();
			return null;

		}
		GeneratedProject project = new GeneratedProject();
		project.setName(userConfig.getConfig().projectName);
		project.setTree(projectTemplateService.createTreeOfFolder(new File(generatedProjectFolder)));
		project.setZip(this.archive(generatedProjectFolder));
		return project;
	}

	private void generateFrontend(UserConfig userConfig) throws IOException {
		if (userConfig.getFrontend() != null && userConfig.getFrontend().getTechnologie() != null) {
			ProjectTemplate template = projectTemplateService.findByNameAndTechnologieName(
					userConfig.getFrontend().getName(), userConfig.getFrontend().getTechnologie().getName());
			if (template != null) {
				File templateFolder = templateLoader.load(template);
				String generatedBackendFolder = generatedProjectFolder + File.separator + "frontend";
				try {
					
					templateEngine.generate(templateFolder, generatedBackendFolder, userConfig.getPojos(),
							userConfig.getConfig());
					history.save(template);
				} catch (TemplateException e) {
					System.out.println("error in frontend template " + template.getName() + " of "
							+ template.getTechnologie().getName());
					e.printStackTrace();
				}
			}
		}

	}

	private void generateBackend(UserConfig userConfig) throws IOException {

		if (userConfig.getBackend() != null && userConfig.getBackend().getTechnologie() != null) {
			ProjectTemplate template = projectTemplateService.findByNameAndTechnologieName(
					userConfig.getBackend().getName(), userConfig.getBackend().getTechnologie().getName());
			if (template != null) {
				File templateFolder = templateLoader.load(template);
				String generatedBackendFolder = generatedProjectFolder + File.separator + "backend";
				try {			
					templateEngine.generate(templateFolder, generatedBackendFolder, userConfig.getPojos(),
							userConfig.getConfig());
					history.save(template);
				} catch (TemplateException e) {
					System.out.println("error in backend template " + template.getName() + " of "
							+ template.getTechnologie().getName());
					e.printStackTrace();
				}
			}
		}
	}

	
	@Override
	public GeneratedProject generate(FileEngineConfig config)  {
		try {
			
			  File generatedFolder = new File(generatedProjectFolder);
	             if(generatedFolder.exists())
				 System.out.println(FileUtil.deleteDirectory(generatedFolder));

		    fileEngine.generate(config, generatedProjectFolder);
			GeneratedProject project = new GeneratedProject();
			project.setName(config.getNameOrSuffix());
			project.setTree(projectTemplateService.createTreeOfFolder(new File(generatedProjectFolder)));
			project.setZip(this.archive(generatedProjectFolder));
			return project;
		} catch (IOException e) {
			e.printStackTrace();

		} catch (TemplateException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
           
		}
		return null;
	}
	
	@Override
	public byte[] generate(String backend, String frontend, MultipartFile file) {
          UserConfig config = new UserConfig();
          try {
        	  config.setPojos(yamlService.getPojosFile(file));
        	  config.setPojos(pojoService.validatePojos(config.getPojos()));

		} catch (IOException | ParseException e) {
			e.printStackTrace();
			System.out.println("error in yaml file");
			return null ;
		}
         Technologie backendTech =  technologieService.findByName(backend);
         if(backendTech != null) {
        	 config.setWantBackend(true);
        	 config.setBackend(backendTech.getDefaultTemplate());
         }
         Technologie frontendTech =  technologieService.findByName(frontend);
         if(frontendTech != null) {
        	 config.setWantFrontend(true);
        	 config.setFrontend(frontendTech.getDefaultTemplate());
         }
		return generate(config).getZip();
	}

	
	private byte[] archive(String filePath) {
		File project = new File(filePath);
		ZipUtil.zipIt(project, project.getParent());
		File projectAsZip = new File(filePath + ".zip");
		byte[] byteArray = ZipUtil.convertZipToByteArray(projectAsZip);

		projectAsZip.delete();
		return byteArray;
	}

}
