package ma.zs.generator.engine.service.impl;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import freemarker.template.TemplateException;
import ma.zs.generator.engine.service.facade.TemplateEngineService;
import ma.zs.generator.engine.service.util.EngineUtil;
import ma.zs.generator.engine.service.util.FileUtil;

import ma.zs.generator.engine.service.util.StringFormatterUtil;
import ma.zs.generator.engine.service.util.StringUtil;
import ma.zs.generator.helper.freemarker.service.facade.FreeMarkerService;
import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.project.config.ProjectConfig;

/**
 * @author Qada
 *
 */
@Service
public class TemplateEngineServiceImpl implements TemplateEngineService {

	@Autowired
	private FreeMarkerService freeMarkerService;

	@Override
	public void generate(File templateFolder, String generatedFolder, List<Pojo> pojos,ProjectConfig config)
			throws IOException, TemplateException {
		FileUtil.createDirectory(generatedFolder);
		scanTemplate(templateFolder, templateFolder.getPath(), pojos, generatedFolder,config);
	}

	@Override
	public void scanTemplate(File template, String projectTemplatePath, List<Pojo> pojos, String outputFolder,ProjectConfig config)
			throws IOException, TemplateException {

		List<File> childs = Arrays.asList(template.listFiles());
		for (File file : childs) {
			if (file.isDirectory()) {
                    FileUtil.createDirectory(replaceAllPlaceHoldersInPath(file.getPath(), config).replace(projectTemplatePath, outputFolder));
				 scanTemplate(file, projectTemplatePath, pojos, outputFolder, config);
			} else {
				if (!EngineUtil.isTemplate(file.getName()))
					copyFile(file, projectTemplatePath, outputFolder,config);
				else {
					if (EngineUtil.isTemplateForMany(file.getName()))
						generateForAllPojos(file, pojos, projectTemplatePath, outputFolder, config);
					else if(EngineUtil.isOptional(file.getName()))
						generateOptional(file, pojos, projectTemplatePath, outputFolder,config);
					else
						generateOne(file, pojos, projectTemplatePath, outputFolder,config);

				}
			}

		}

	}

	
	private void copyFile(File file, String src, String dest,ProjectConfig config) throws IOException {
		System.out.println(
				"copy " + file.getName() + " from " + file.getParent() + " to " + file.getParent().replace(src, dest));

		FileUtil.copyFile(file.getPath(),replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest),config)+ File.separator + file.getName());

	}

	private void generateForAllPojos(File file, List<Pojo> pojos, String src, String dest,ProjectConfig config)
			throws IOException, TemplateException {
		System.out.println("generate all " + file.getName());
		String suffix = EngineUtil.getSuffixOrName(file.getName());
		if(EngineUtil.isPlaceHolder(suffix))
			suffix = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(suffix), config);
		String extensions = EngineUtil.getExtension(file.getName());
		String outputDirectory =replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest),config);
		if(!EngineUtil.isComponent(file.getName())) {
			for (Pojo pojo : pojos) {
				freeMarkerService.generateFileWithOnePojo(pojo,  file.getName(), file.getParent() + File.separator, pojo.getName()+suffix+"."+extensions, outputDirectory,config);
			}
		}
	
		else {
			for (Pojo pojo : pojos) {
				generateFilesInFolders(pojo, file.getName(), suffix, extensions, outputDirectory,
						file.getParent() + File.separator,config);
			}

		}
			
	}
	private void generateOptional(File file, List<Pojo> pojos, String src, String dest,ProjectConfig config)
			throws IOException, TemplateException {
		String fileName = file.getName();
       if(isValidOptional(EngineUtil.getCondition(fileName),config)) {
    	   fileName = EngineUtil.cutCondition(fileName);
    	   if(EngineUtil.isPlaceHolder(fileName))
    			 fileName = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(EngineUtil.getSuffixOrName(fileName)),config);
    			else
    				fileName = EngineUtil.getSuffixOrName(fileName);
    			String extension = EngineUtil.getExtension(EngineUtil.cutCondition(file.getName()).replaceAll("[{}]",""));
    			String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest),config);
    			System.out.println(" generate "+fileName+"."+extension+" in "+outputDirectory);

    			freeMarkerService.generateFile(pojos, file.getName(), fileName, extension, outputDirectory,
    					file.getParent() + File.separator,config);
       }
		
	}

	

	private void generateOne(File file, List<Pojo> pojos, String src, String dest,ProjectConfig config)
			throws IOException, TemplateException {
		String fileName = file.getName();
		if(EngineUtil.isPlaceHolder(fileName))
		 fileName = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(EngineUtil.getSuffixOrName(fileName)),config);
		else
			fileName = EngineUtil.getSuffixOrName(fileName);
		String extension = EngineUtil.getExtension(file.getName().replaceAll("[{}]",""));
		String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest),config);
		System.out.println(" generate "+fileName+"."+extension+" in "+outputDirectory);

		freeMarkerService.generateFile(pojos, file.getName(), fileName, extension, outputDirectory,
				file.getParent() + File.separator,config);
	}

	private void generateFilesInFolders(Pojo pojo, String templateName, String suffix, String extensions,
			String outputDirectory, String templatePath ,ProjectConfig config) throws IOException, TemplateException {
		 outputDirectory +=	File.separator+StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName());

			FileUtil.createDirectory(outputDirectory);
			if(EngineUtil.inFolder(templateName)) {
			 outputDirectory +=	File.separator+EngineUtil.getFolder(templateName);
			FileUtil.createDirectory(outputDirectory);
           freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath, StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName())+"-"+suffix +"."+extensions, outputDirectory, config);
			}
			else {
				  if(StringUtil.isEmpty(suffix))
		           freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath, StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName())+"."+extensions, outputDirectory, config);
				  else
			        freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath,suffix+"."+extensions, outputDirectory, config);

			}
			
 
		
	}
	
	  private String replaceAllPlaceHoldersInPath(String path ,ProjectConfig projectConfig) {
		   if(!path.contains("{")||!path.contains("}"))
		  return path;
		   else {
			 String[] names = path.split(File.separator+File.separator);
			  String newPath=names[0] ;
			 for (int i = 1; i < names.length; i++) {
				 if(EngineUtil.isPlaceHolder(names[i]))
				  newPath += File.separator+replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(names[i]),projectConfig) ;
				 else
					  newPath += File.separator +names[i];
				 
			}
			 return newPath;
		   }
	   }
	  private String replacePlaceholderWithTheEquivalentValue(String name,ProjectConfig projectConfig) {
		    Class clazz = projectConfig.getClass();
	        String fieldValue ;
	       
			Field field;
			try {
				field = clazz.getDeclaredField(name);
				fieldValue = (String)field.get(projectConfig);
                return fieldValue;
			} catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return name;
			}
				
	  }
	  private boolean isValidOptional(String condition,ProjectConfig projectConfig) {
		    Class clazz = projectConfig.getClass();
	        boolean fieldValue ;
	       
			Field field;
			try {
				field = clazz.getDeclaredField(condition);
				fieldValue = (boolean)field.get(projectConfig);
	            return fieldValue;
			} catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
				
		}
}
