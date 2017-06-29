package net.server.thread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.lang.reflect.Executable;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.util.List;

public class ChatServerScoketThread13 extends Thread {
	private BufferedReader fromClient;
	private PrintWriter toClient;
	private Socket socket;
	private List<ChatServerScoketThread13> threadList;
	boolean loopFlag;
	private SocketAddress socketAddress;
	private String clientName;
	
	public ChatServerScoketThread13(){
		
	}
	public ChatServerScoketThread13(Socket socket, List<ChatServerScoketThread13> threadList){
		this.socket = socket;
		this.threadList = threadList;
		this.socketAddress = socket.getRemoteSocketAddress();
		
		try{
			fromClient = new BufferedReader(new InputStreamReader(socket.getInputStream(), "utf-8"));
			toClient = new PrintWriter(new OutputStreamWriter(socket.getOutputStream(), "utf-8"),true);
			
			loopFlag = true;
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void run(){
		System.out.println("\t\t[ServerScoketThread: "+socketAddress+"]data 송수신 Loop Start");
		String fromClientData = null;
		int threadId = Integer.parseInt(this.getName().substring(7));
		while(loopFlag){
			try{
				if((fromClientData = fromClient.readLine())!=null){
					System.out.println("\t\t[ServerScoketThread: "+socketAddress+"]receive data-> "+fromClientData);
					for(int i = 0;i<threadList.size();i++){
						if(threadId != Integer.parseInt(threadList.get(i).getName().substring(7))){
							System.out.println("#"+i+" thread 접근");
							execute(fromClientData.substring(0, 3),fromClientData.substring(4));
						}
					}
				}else{
					break;
				}
			}catch (SocketException se) {
				se.printStackTrace();
				loopFlag = false;
			}catch (Exception e) {
				e.printStackTrace();
				loopFlag = false;
			}
		}
		
		System.out.println("\n\t\t[ServerScoketThread: "+socketAddress+"]data 송수신 Loop End");
		threadClose();
	}
	private void execute(String protocol, String message) {
		switch(protocol){
		case "100":
			this.clientName =message;
			if(hasName(message)){
				System.out.println("대화명중복:"+message);
				toClient.println("["+message+"] 대화명 중복");
				loopFlag = false;
			}else{
				toAllClient("["+message+"] 입장");
			}
			break;
		case "200":
			toAllClient("["+clientName+"]:" + message);
			break;
		case "400":
			toAllClient("["+message+"] 퇴장");			
			break;
		default:
			break;
		}		
	}
	
	public synchronized boolean hasName(String clientName){
		for(ChatServerScoketThread13 thread : threadList){
			if(thread != this && clientName.equals(thread.getClientName())){
				return true;
			}
		}
		return false;
	}
	
	public synchronized void toAllClient(String message){
		for(ChatServerScoketThread13 thread : threadList){
			thread.getToClient().println(message);
		}
	}
	
	public void threadClose(){
		System.out.println("\t\t[ServerScoketThread: threadClose start]");
		try{
			if(toClient != null){
				toClient.close();
				toClient = null;
			}
			if(fromClient != null){
				fromClient.close();
				fromClient = null;
			}
			if(socket != null){
				socket.close();
				socket = null;
			}
			//종료 작업이 끝나고 정상적으로 list에서 나옴
			threadList.remove(this);
		}catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("\t\t[ServerScoketThread: threadClose end]");
	}
	
	public PrintWriter getToClient() {
		return toClient;
	}
	public void setLoopFlag(boolean loopFlag) {
		this.loopFlag = loopFlag;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	
}
