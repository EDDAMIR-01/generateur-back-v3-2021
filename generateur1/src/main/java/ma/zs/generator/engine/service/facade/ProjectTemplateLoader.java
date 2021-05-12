package ma.zs.generator.engine.service.facade;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

import ma.zs.generator.project.bean.ProjectTemplate;

/**
 * @author Qada
 *
 */
public interface ProjectTemplateLoader {

	File load(ProjectTemplate projectTemplate);

	File loadFromGithub(ProjectTemplate projectTemplate) throws MalformedURLException, IOException;

	File loadFromFileSystem(ProjectTemplate projectTemplate);
}
