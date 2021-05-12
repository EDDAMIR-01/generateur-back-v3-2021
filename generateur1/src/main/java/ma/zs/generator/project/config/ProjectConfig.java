package ma.zs.generator.project.config;


/**
 * @author Qada
 *
 */
public class ProjectConfig {

	public String projectName = "generated";
	public String groupId = "zs";
	public String domain = "ma";
	public String bean = "bean";
	public String dao = "dao";
	public String service = "service";
	public String serviceFacade = "facade";
	public String serviceImpl = "impl";
	public String serviceUtil = "util";
	public String ws = "ws";
	public String rest = "rest";
	public String provided = "provided";
	public String restFacade = "facade";
	public String vo = "vo";
	public String converter = "converter";
	public boolean swagger = true;
    public boolean flyWayDb = true;
    public String mainClass = ((projectName.charAt(0) + "").toUpperCase()) + projectName.substring(1)+"Application";
	private BackendConfig backend;
	private FrontendConfig frontend;

	public ProjectConfig() {
		super();
		this.backend = new BackendConfig();
		this.frontend = new FrontendConfig();
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
		mainClass = ((projectName.charAt(0) + "").toUpperCase()) + projectName.substring(1)+"Application";
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public BackendConfig getBackend() {
		return backend;
	}

	public void setBackend(BackendConfig backend) {
		this.backend = backend;
	}

	public FrontendConfig getFrontend() {
		return frontend;
	}

	public void setFrontend(FrontendConfig frontend) {
		this.frontend = frontend;
	}

	
	
	public String getBean() {
		return bean;
	}

	public void setBean(String bean) {
		this.bean = bean;
	}

	public String getDao() {
		return dao;
	}

	public void setDao(String dao) {
		this.dao = dao;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getServiceFacade() {
		return serviceFacade;
	}

	public void setServiceFacade(String serviceFacade) {
		this.serviceFacade = serviceFacade;
	}

	public String getServiceImpl() {
		return serviceImpl;
	}

	public void setServiceImpl(String serviceImpl) {
		this.serviceImpl = serviceImpl;
	}

	public String getServiceUtil() {
		return serviceUtil;
	}

	public void setServiceUtil(String serviceUtil) {
		this.serviceUtil = serviceUtil;
	}

	public String getWs() {
		return ws;
	}

	public void setWs(String ws) {
		this.ws = ws;
	}

	public String getRest() {
		return rest;
	}

	public void setRest(String rest) {
		this.rest = rest;
	}

	public String getProvided() {
		return provided;
	}

	public void setProvided(String provided) {
		this.provided = provided;
	}

	public String getRestFacade() {
		return restFacade;
	}

	public void setRestFacade(String restFacade) {
		this.restFacade = restFacade;
	}

	public String getVo() {
		return vo;
	}

	public void setVo(String vo) {
		this.vo = vo;
	}

	public String getConverter() {
		return converter;
	}

	public void setConverter(String converter) {
		this.converter = converter;
	}

	
	public String getMainClass() {
		return mainClass;
	}

	public void setMainClass(String mainClass) {
		this.mainClass = mainClass;
	}

	public boolean getSwagger() {
		return swagger;
	}

	public void setSwagger(boolean swagger) {
		this.swagger = swagger;
	}

	public boolean getFlyWayDb() {
		return flyWayDb;
	}

	public void setFlyWayDb(boolean flyWayDb) {
		this.flyWayDb = flyWayDb;
	}

	
	
}
