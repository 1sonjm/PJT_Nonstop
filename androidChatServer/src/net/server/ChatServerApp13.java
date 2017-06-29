package net.server;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.Vector;

import net.server.thread.ChatServerScoketThread13;

public class ChatServerApp13 {

	public static void main(String[] args) {
		System.out.println("===================================================");
		System.out.println("[EchoMultiServerApp Main Thread] start\n");
		
		//socketThread 여럿을 관리하기위해 list를 사용하고 동기화를 위해 vector를 사용
		List<ChatServerScoketThread13> threadList = new Vector<ChatServerScoketThread13>(10,10);
		
		ServerSocket serverSocket = null;
		Socket socket = null;
		
		ChatServerScoketThread13 serverScoketThread = null;
		boolean loopFlag = false;
		
		try{
			serverSocket = new ServerSocket(7000);
			loopFlag = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		while(loopFlag){
			try{
				System.out.println("\n\t//////////////////////////////////////////////");
				System.out.println("\t[EchoMultiServerApp Main Thread] Connection wait start");
				
				socket = serverSocket.accept();
				System.out.println("\n\t\t[Host Main thread]: client"+socket.getRemoteSocketAddress()+" 연결");
				serverScoketThread = new ChatServerScoketThread13(socket, threadList);
				
				threadList.add(serverScoketThread);
				
				System.out.println("\t[EchoMultiServerApp Main Thread] 접속자수:"+threadList.size()+"\n");
				serverScoketThread.start();
				
			}catch(Exception e){
				e.printStackTrace();
				loopFlag = false;
			}
		}
		
		System.out.println("\t[EchoMultiServerApp Main Thread] Connection wait end");
		System.out.println("\n\t//////////////////////////////////////////////");
		
		//서버가 종료될시 하위 client과의 연결을 정상적으로 끊어주기위해 flag를 사용하여 제어 
		synchronized(threadList){
			for(ChatServerScoketThread13 thread: threadList){
				thread.setLoopFlag(false);
			}
		}
		
		//daemon thread들 에게 내린 작업을 모두 끝내고 이곳으로
		//작업할당이 올지 알수없기에 모든 daemon thread가 끝나길 기다림
		while(true){
			if(threadList.size() != 0){
				try{
					Thread.sleep(1000);
				}catch(Exception e){
					e.printStackTrace();
				}
			}else{
				break;
			}
		}
		
		try{
			if(serverSocket != null){
				serverSocket.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		System.out.println("[EchoMultiServerApp Main Thread] ShutDown");
		System.out.println("===================================================");
	}
}
