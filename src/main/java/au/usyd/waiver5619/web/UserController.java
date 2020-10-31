package au.usyd.waiver5619.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		return "views/profile";
	}
	
	@RequestMapping(value = "/sign_in", method = RequestMethod.GET)
	public String sign_in() {
		return "views/sign_in";
	}
	
	@RequestMapping(value = "/fgt_psd", method = RequestMethod.GET)
	public String fgt_psd() {
		return "views/fgt_psd";
	}
	
	@RequestMapping("avatarUpload")
	public String avatarUpload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IOException {
		System.out.println("OriginalFilename: " + file.getOriginalFilename());
		//System.out.println("InputStream: " + file.getInputStream());
		
		//Get File upload real path
		String path = request.getSession().getServletContext().getRealPath("/avatar");
		
		//Create a new file object
		File newfile = new File(path);
		if(!newfile.exists()) {
			newfile.mkdirs();
		}
		//Get file name
		String name = System.currentTimeMillis()+file.getOriginalFilename();
		System.out.println("File path: " + path);
		File targetFile = new File(path+"/"+name);
		try {
			//Write file into the specific path
			FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "views/profile";
	}
	
	

}
