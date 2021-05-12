/**
 * 
 */
package ma.zs.generator.helper.pojo.service.util;

import java.util.Arrays;
import java.util.List;

/**
 * @author Ouiam
 *
 */
public class PojoUtil {
	
	public static boolean isNumberOrDate(String typeName) {
		List<String> types = Arrays.asList("int", "Integer", "float", "Float", "double", "Double", "long", "Long",
				"BigDecimal", "Date");
		return types.contains(typeName);
	}

	public static boolean isPrimitif(String typeName) {
		List<String> types = Arrays.asList("boolean", "Boolean", "String", "int", "Integer", "float", "Float", "double",
				"Double", "long", "Long", "BigDecimal", "Date");
		return types.contains(typeName);
	}

	public static boolean isList(String typeName) {
		List<String> collectionTypes = Arrays.asList("List", "list", "ArrayList","Collection");
		return collectionTypes.contains(typeName);
	}

}
