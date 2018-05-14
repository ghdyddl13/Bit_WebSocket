package socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Chat extends TextWebSocketHandler{

	private List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		System.out.println("연결");
		System.out.println("sessionid : " + session.getId());
		System.out.println("AcceptedProtocol" + session.getAcceptedProtocol());
		System.out.println("Uri" + session.getUri());
	
		
	/*	for(WebSocketSession sess : list) {
			sess.sendMessage("입장했어요 뿌잉뿌잉");
		}*/
		
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		for(WebSocketSession sess : list) {
			sess.sendMessage(message);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}

}
