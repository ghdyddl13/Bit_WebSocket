package socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Chat extends TextWebSocketHandler{

	private Map<String, List<WebSocketSession>> usermap = new HashMap();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		
		Map<String, Object> map = session.getAttributes();
		String chatname = (String) map.get("select");
		System.out.println("afterConnectionEstablished = " + chatname);
	
		if(usermap.containsKey(chatname)) {
			usermap.get(chatname).add(session);
			System.out.println("여기");
		}else {
			System.out.println("else");
			List<WebSocketSession> list = new ArrayList<WebSocketSession>();
			list.add(session);
			usermap.put(chatname, list);
		}
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String chatroom = null;
		Map<String, Object> map = session.getAttributes();
		
		String chatname = (String) map.get("select");
		System.out.println("handleMessage :" + chatname);
		for(String key : usermap.keySet()) {
			if(key ==chatname) {
				chatroom = chatname;
			}
		}
		
		for (WebSocketSession sess : usermap.get(chatname)) {
			sess.sendMessage(message);
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(exception.getMessage());
	}
	
	

}
