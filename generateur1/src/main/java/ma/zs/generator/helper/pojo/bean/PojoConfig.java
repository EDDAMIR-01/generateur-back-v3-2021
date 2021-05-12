/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.zs.generator.helper.pojo.bean;

import java.io.File;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author gouss
 */
@Entity
public class PojoConfig implements Serializable {

    @Id
    private Long id;

    private static String reference = "REF" ;
    private static String idDefaultName = "ID" ;
    private static String idDefaultType = "Long";
    private static String beanPath = "main"+File.separator+"java"+File.separator+"ma"+File.separator+"zs"+File.separator+"generator"+File.separator+"bean";
    private static String packageRoot = "ma.zs.generator";
    private static String packageBean = packageRoot+".bean";
    
    public static String getReference() {
        return reference;
    }

    public static String getIdDefaultName() {
        return idDefaultName;
    }

    public static String getIdDefaultType() {
        return idDefaultType;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public void setIdDefaultName(String idDefaultName) {
        this.idDefaultName = idDefaultName;
    }

    public void setIdDefaultType(String idDefaultType) {
        this.idDefaultType = idDefaultType;
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public static String getBeanPath() {
		return beanPath;
	}

	public static void setBeanPath(String beanPath) {
		PojoConfig.beanPath = beanPath;
	}

	public static String getPackageRoot() {
		return packageRoot;
	}

	public static void setPackageRoot(String packageRoot) {
		PojoConfig.packageRoot = packageRoot;
	}

	public static String getPackageBean() {
		return packageBean;
	}

	public static void setPackageBean(String packageBean) {
		PojoConfig.packageBean = packageBean;
	}
    
    

}
