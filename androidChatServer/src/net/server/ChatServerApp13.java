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
		
		//socketThread ������ �����ϱ����� list�� ����ϰ� ����ȭ�� ���� vector�� ���
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
				System.out.println("\n\t\t[Host Main thread]: client"+socket.getRemoteSocketAddress()+" ����");
				serverScoketThread = new ChatServerScoketThread13(socket, threadList);
				
				threadList.add(serverScoketThread);
				
				System.out.println("\t[EchoMultiServerApp Main Thread] �����ڼ�:"+threadList.size()+"\n");
				serverScoketThread.start();
				
			}catch(Exception e){
				e.printStackTrace();
				loopFlag = false;
			}
		}
		
		System.out.println("\t[EchoMultiServerApp Main Thread] Connection wait end");
		System.out.println("\n\t//////////////////////////////////////////////");
		
		//������ ����ɽ� ���� client���� ������ ���������� �����ֱ����� flag�� ����Ͽ� ���� 
		synchronized(threadList){
			for(ChatServerScoketThread13 thread: threadList){
				thread.setLoopFlag(false);
			}
		}
		
		//daemon thread�� ���� ���� �۾��� ��� ������ �̰�����
		//�۾��Ҵ��� ���� �˼����⿡ ��� daemon thread�� ������ ��ٸ�
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
