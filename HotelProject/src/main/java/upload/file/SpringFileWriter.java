package upload.file;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class SpringFileWriter {
	FileOutputStream fos;
	
	public void writeFile(MultipartFile file,String path, String fileName) {
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream(path + "/" + fileName);
			fos.write(fileData);
			
		}catch(IOException e) {
			System.out.println(e.getMessage());
			
		}finally {
			try {
				fos.close();
			}catch(IOException e) {
				
			}
		}
		
	}
			

		
}
