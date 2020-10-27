package au.usyd.waiver5619.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	
	@RequestMapping(value = "/test1",method = RequestMethod.GET)
	public String getTest() {
		return"views/donate-info";
	}
}
