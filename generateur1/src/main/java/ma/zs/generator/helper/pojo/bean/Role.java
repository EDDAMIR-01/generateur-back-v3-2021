package ma.zs.generator.helper.pojo.bean;

import java.util.List;

/**
 * @author Qada
 *
 */
public class Role {

	private String name  ="USER";
	private List<Pojo> pojos ;
	
	public Role() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Pojo> getPojos() {
		return pojos;
	}
	public void setPojos(List<Pojo> pojos) {
		this.pojos = pojos;
	}
	
	
}
