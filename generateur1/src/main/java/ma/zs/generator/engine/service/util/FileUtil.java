package ma.zs.generator.engine.service.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * @author Qada
 *
 */
public class FileUtil {
	
	  public static void createDirectory(String path) throws IOException {
	        if (path != null && !path.equals("")) {
	            System.out.println("create " + path);
	            Files.createDirectories(Paths.get(path));
	        }
	    }
	  public static boolean deleteDirectory(File directoryToBeDeleted) {
			File[] allContents = directoryToBeDeleted.listFiles();
			if (allContents != null) {
				for (File file : allContents) {
					deleteDirectory(file);
				}
			}
			return directoryToBeDeleted.delete();
		}
	  public static void deleteFileIfExist(File file) {
			if (file.exists()) {
				if(deleteDirectory(file))
					System.out.println("file " +file.getName()+"deleted");;
			}
		}
	  public static void copyFile(String sourcePath, String destPath) throws IOException {
		  File source = new File(sourcePath);
		  File dest = new File(destPath);
		    InputStream is = null;
		    OutputStream os = null;
		    try {
		        is = new FileInputStream(source);
		        os = new FileOutputStream(dest);
		        byte[] buffer = new byte[1024];
		        int length;
		        while ((length = is.read(buffer)) > 0) {
		            os.write(buffer, 0, length);
		        }
		    } finally {
		        is.close();
		        os.close();
		    }
		}

}
