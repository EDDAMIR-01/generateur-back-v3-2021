package ma.zs.generator.project.config;

/**
 * @author Qada
 *
 */
public class BackendConfig {
	private Integer port = 8080;
	private String dataSourceUserName = "root";
	private String dataSourcePassword = "";
	private String databaseName;
	private String dataSourceUrl;
	
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getDataSourceUserName() {
		return dataSourceUserName;
	}
	public void setDataSourceUserName(String dataSourceUserName) {
		this.dataSourceUserName = dataSourceUserName;
	}
	public String getDataSourcePassword() {
		return dataSourcePassword;
	}
	public void setDataSourcePassword(String dataSourcePassword) {
		this.dataSourcePassword = dataSourcePassword;
	}
	public String getDatabaseName() {
		return databaseName;
	}
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	public String getDataSourceUrl() {
		return dataSourceUrl;
	}
	public void setDataSourceUrl(String dataSourceUrl) {
		this.dataSourceUrl = dataSourceUrl;
	}
	
}
