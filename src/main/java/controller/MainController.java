package controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.mycom.model.RoomDAO;
import kr.co.mycom.model.RoomDto;

@Controller
public class MainController {
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping("/index.htm")
	public String main(Model model) {

		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		List<RoomDto> list = roomdao.getRoomList();
		model.addAttribute("list", list);
		return "main";
	}
	
	@RequestMapping("chat.htm")
	public String chat(String id, String select, Model model) {
		System.out.println(id +"///"+ select);
		model.addAttribute("id", id);
		model.addAttribute("select", select);
		return "chat";
	}
	
	@RequestMapping("room.htm")
	public String insertroom(RoomDto dto, Model model) {
		/*model.addAttribute("id", id);
		model.addAttribute("select", select);*/
		
		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		roomdao.insertRoom(dto);
		
		return "redirect:/index.htm";
	}
	
	/*@RequestMapping("room.htm")
	public String getroom(Model model) {
		model.addAttribute("id", id);
		model.addAttribute("select", select);
		
		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		roomdao.getRoomList();
		
		return "chat";
	}*/

}
