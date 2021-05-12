/**
 * 
 */
package ma.zs.generator.engine.service.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Ouiam and Qada
 *
 */
public class EngineUtil {

	public static boolean isTemplate(String fileName) {
		if (fileName.endsWith(".ftl"))
			return true;
		else return false;
	}
	
	public static boolean isTemplateForMany(String fileName) {
		if (fileName.contains(".all."))
			return true;
		else
			return false;
	}
	public static boolean isComponent(String fileName) {
		if (fileName.contains(".cpn."))
			return true;
		else return false;
	}
	
	public static String getSuffixOrName(String fileName) {
		return (fileName.split("\\."))[0];
	}
	
	public static String getExtension(String fileName) {
		Pattern pattern ;
		if(fileName.contains(".all.")) {
			if(!fileName.contains(".cpn."))
			 pattern = Pattern.compile("all.(.*?).ftl", Pattern.DOTALL);
			else
			 pattern = Pattern.compile("cpn.(.*?).ftl", Pattern.DOTALL);

		}
			else
			 pattern = Pattern.compile(getSuffixOrName(fileName)+".(.*?).ftl", Pattern.DOTALL);

			Matcher matcher = pattern.matcher(fileName);
			while (matcher.find()) {
				return matcher.group(1);

			}
			return null;
			
	}
	public static String getFolder(String fileName) {
		if(fileName.contains(".all.")&& fileName.contains(".cpn.")){
		Pattern pattern =  Pattern.compile("all.(.+).cpn", Pattern.DOTALL);
		Matcher matcher = pattern.matcher(fileName);
		while (matcher.find()) {
			return matcher.group(1);
		}
		return null;
		
		}
		return null;
	}
	public static boolean inFolder(String fileName) {
		if(getFolder(fileName)==null)
			return false;
		else 
			return true;
	}
	
	public static String getPlaceHolder(String fileName) {
		if(fileName.contains("{")&& fileName.contains("}")){
		Pattern pattern =  Pattern.compile("\\{(.+)\\}", Pattern.DOTALL);
		Matcher matcher = pattern.matcher(fileName);
		while (matcher.find()) {
			return matcher.group(1);
		}
		return null;
		
		}
		return null;
	}
	public static boolean isPlaceHolder(String fileName) {
		if(getPlaceHolder(fileName)==null)
			return false;
		else 
			return true;
	}
	
	public static boolean isOptional(String fileName)
	{  if(getCondition(fileName)==null)
		  return false;
		else
		  return true;
	}
	 public static String getNameOfOptionel(String fileName) {
			return fileName.substring(0, fileName.indexOf('['));
			
		 }
	 public static String cutCondition(String fileName) {
			return fileName.replace("["+getCondition(fileName)+"]", "");
			
		 }
	public static String getCondition(String fileName) {
		Pattern pattern =  Pattern.compile("\\[(.+)\\]", Pattern.DOTALL);
		Matcher matcher = pattern.matcher(fileName);
		while (matcher.find()) {
			return matcher.group(1);
		}
		return null;
	}}
