package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mycom.model.RoomDAO;
import kr.co.mycom.model.RoomDto;
import kr.co.mycom.model.UserDto;


@Controller
public class MainController {
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping("/index.htm")
	public String login() {

		/*RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		List<RoomDto> list = roomdao.getRoomList();
		model.addAttribute("list", list);*/
		return "login";
	}
	
	@RequestMapping(value="/join.htm" , method=RequestMethod.GET)
	public String join() {

		/*RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		List<RoomDto> list = roomdao.getRoomList();
		model.addAttribute("list", list);*/
		return "join";
	}
	@RequestMapping(value="/join.htm" , method=RequestMethod.POST)
	public String join2(UserDto dto) {

		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		int c = roomdao.joinUser(dto);
		String url =null;
		if(c==0) {
			url = "join";
		}else {
			url = "login";
		}
		
		return url;
	}
	
	@RequestMapping("/main.htm")
	public String main(Model model) {

		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		List<RoomDto> list = roomdao.getRoomList();
		model.addAttribute("list", list);
		return "main";
	}
	
	@RequestMapping("chat.htm")
	public String chat(String roomname, String select, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("nickname");
		
		
		model.addAttribute("id", session.getAttribute("nickname"));
		model.addAttribute("select", select);
		model.addAttribute("roomname", roomname);
		return "chat";
	}
	
	@RequestMapping("room.htm")
	public String insertroom(RoomDto dto, Model model) {
		/*model.addAttribute("id", id);
		model.addAttribute("select", select);*/
		
		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		roomdao.insertRoom(dto);
		
		return "redirect:/main.htm";
	}
	
	@RequestMapping("login.htm")
	public String getLogin(String userid,String pwd, Model model,HttpServletRequest request) {
		System.out.println("로그인처리");
		RoomDAO roomdao = sqlsession.getMapper(RoomDAO.class);
		/*emp e = empservice.getLogin(id,pw);*/
		UserDto user = roomdao.loginUser(userid, pwd);
		String result="";
		if(user !=null) {
			HttpSession session = request.getSession();
			session.setAttribute("nickname", user.getUserid());
			System.out.println(user.getUserid());
			System.out.println("get:"+session.getAttribute("nickname"));
			result="redirect:main.htm";
		}else {
			result="login.jsp";
		}
		return result;
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
