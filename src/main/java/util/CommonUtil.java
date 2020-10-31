package util;

import java.util.UUID;

import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

public class CommonUtil {

	public static String randomSalt() {
		return UUID.randomUUID().toString().substring(0,5).replaceAll("-", "");
	}
	
	public static String md5(String key) {
		if (StringUtils.isEmpty(key)) {
			return null;
		}
		String password=DigestUtils.md5DigestAsHex(key.getBytes());
		return password;
	}
	
	
}
