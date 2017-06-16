package com.nonstop.socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class Broadsocket {
	public Broadsocket()
	{
		super();
		System.out.println("broadcasting");
	}

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			//모든 사용자에게 전달
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println("[onOpen] "+session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		System.out.println("[onClose] "+session);
		clients.remove(session);
	}
}