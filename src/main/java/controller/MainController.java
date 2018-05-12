package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index.htm")
	public String main() {
		return "main";
	}
	
	@RequestMapping("chat.htm")
	public String chat() {
		return "chat";
	}
}
