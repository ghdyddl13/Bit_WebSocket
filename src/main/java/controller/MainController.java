package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index.htm")
	public String main() {
		return "main";
	}
	
	@RequestMapping("chat.htm")
	public String chat(String id, String select, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("select", select);
		return "chat";
	}

}
