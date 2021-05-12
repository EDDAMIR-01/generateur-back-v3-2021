package ma.zs.generator.project.config;

import java.util.List;

import ma.zs.generator.helper.pojo.bean.Pojo;
import ma.zs.generator.helper.pojo.bean.Role;
import ma.zs.generator.project.bean.ProjectTemplate;

/**
 * @author Qada
 *
 */
public class UserConfig {

	private List<Pojo> pojos ;
	
	private ProjectTemplate backend;
	private boolean wantBackend  = true;
	private List<Role> roles;
	private ProjectTemplate frontend;
	private boolean wantFrontend  = true;

    private ProjectConfig config;
	
	public UserConfig() {
		super();
		this.config = new ProjectConfig();
	}

	public List<Pojo> getPojos() {
		return pojos;
	}

	public void setPojos(List<Pojo> pojos) {
		this.pojos = pojos;
	}

	public ProjectTemplate getBackend() {
		return backend;
	}

	public void setBackend(ProjectTemplate backend) {
		this.backend = backend;
	}

	public boolean isWantBackend() {
		return wantBackend;
	}

	public void setWantBackend(boolean wantBackend) {
		this.wantBackend = wantBackend;
	}

	public ProjectTemplate getFrontend() {
		return frontend;
	}

	public void setFrontend(ProjectTemplate frontend) {
		this.frontend = frontend;
	}

	public boolean isWantFrontend() {
		return wantFrontend;
	}

	public void setWantFrontend(boolean wantFrontend) {
		this.wantFrontend = wantFrontend;
	}

	public ProjectConfig getConfig() {
		return config;
	}

	public void setConfig(ProjectConfig config) {
		this.config = config;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	
}
