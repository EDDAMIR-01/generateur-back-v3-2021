package ma.zs.generator.engine.service.impl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import freemarker.template.TemplateException;
import freemarker.template.utility.StringUtil;
import ma.zs.generator.engine.bean.FileEngineConfig;
import ma.zs.generator.engine.service.facade.FileEngine;
import ma.zs.generator.engine.service.util.FileUtil;
import ma.zs.generator.helper.freemarker.service.facade.FreeMarkerService;
import ma.zs.generator.helper.pojo.bean.Pojo;

/**
 * @author Qada
 *
 */
@Service
public class FileEngineImpl implements FileEngine{

	@Autowired
	private FreeMarkerService freeMarkerService;

	@Override
	public void generate(FileEngineConfig config,String generatedFolder) throws IOException, TemplateException {
		FileUtil.createDirectory(generatedFolder);
		if (config.isForeachEntities()) {
			  for (Pojo pojo  : config.getPojos()) {
				  String fileName ;
				   if( config.getNameOrSuffix()!=null)
				   fileName = pojo.getName()+config.getNameOrSuffix()+"."+config.getExtension();
				   else
				   fileName = pojo.getName()+"."+config.getExtension();

				  freeMarkerService.generateFileWithOnePojo(pojo,fileName,generatedFolder,config.getTemplate());
			}
		}
		else {
			String fileName = config.getNameOrSuffix()+"."+config.getExtension();
			freeMarkerService.generateFile(config.getPojos(), fileName,generatedFolder,config.getTemplate());
		}
		
	}
	
	

}
