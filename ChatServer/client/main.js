/*var isMozilla = window.mozRTCPeerConnection && !window.webkitRTCPeerConnection;*/
if (!window.RTCPeerConnection) {
	window.RTCPeerConnection = window.webkitRTCPeerConnection;
}

var selfView;
var remoteView;
var callButton;
var audioCheckBox;
var videoCheckBox;
var audioOnlyView;
var signalingChannel;
var pc;
var peer;
var localStream;
var chatDiv;
var chatText;
var chatButton;
var chatCheckBox;
var channel;

if (!window.hasOwnProperty("orientation"))
	window.orientation = -90;

var configuration = {
  "iceServers": [
  {
	"urls": "stun:mmt-stun.verkstad.net"
  },
  {
	"urls": "turn:mmt-turn.verkstad.net",
	"username": "webrtc",
	"credential": "secret"
  }
  ]
};
window.onload = function () {
	selfView = document.getElementById("self_view");
	remoteView = document.getElementById("remote_view");
	callButton = document.getElementById("call_but");
	audioCheckBox = document.getElementById("audio_cb");
	videoCheckBox = document.getElementById("video_cb");
	var shareView = document.getElementById("share-container");
	chatText = document.getElementById("chat_txt");
	chatButton = document.getElementById("chat_but");
	chatDiv = document.getElementById("chat_div");
	chatCheckBox = document.getElementById("chat_cb");

	audioCheckBox.checked = "true";
	videoCheckBox.checked = "true";
	chatCheckBox.checked = "true";

	
	var hash = location.hash.substr(1);
	if (hash) {// 주소로 들어온 사람
		document.getElementById("session_txt").value = hash;
		//log("Auto-joining session: " + hash);
		// 채팅만 설정할때 바로 콜되네?
		document.getElementById("join_but").click();
	} else {// 최초 방 생성자
		// set a random session id
		document.getElementById("session_txt").value = Math.random().toString(16).substr(10);//방ID 부여 (여기에 사용자 id넣으면 되겠다.)
	}
	

    window.IsAndroidChrome = false;
    try {
        if (navigator.userAgent.toLowerCase().indexOf("android") > -1 && /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor)) {
            window.IsAndroidChrome = true;
        }
    } catch (e) {}
    
	document.getElementById("capture-screen").onclick = function () {
		getScreenId(function(error, sourceId, screen_constraints) {
            // error    == null || 'permission-denied' || 'not-installed' || 'installed-disabled' || 'not-chrome'
            // sourceId == null || 'string' || 'firefox'
            // getUserMedia(screen_constraints, onSuccess, onFailure);

            document.getElementById('capture-screen').disabled = false;

            if (IsAndroidChrome) {
                screen_constraints = {
                    mandatory: {
                        chromeMediaSource: 'screen'
                    },
                    optional: []
                };
                
                screen_constraints = {
                    video: screen_constraints
                };

                error = null;
            }

            if(error == 'not-installed') { alert('Please install Chrome extension. See the link below.'); return; }
            if(error == 'installed-disabled') { alert('Please install or enable Chrome extension. Please check "chrome://extensions" page.'); return; }
            if(error == 'permission-denied') { alert('Please make sure you are using HTTPs. Because HTTPs is required.'); return; }

            console.info('getScreenId callback \n(error, sourceId, screen_constraints) =>\n', error, sourceId, screen_constraints);

            //chromeMediaSourceId 가 없다는데 어떻게 해야되는걸까
        	//screen_constraints.mandatory.chromeMediaSourceId = sourceId;
        	
        	
            document.getElementById('capture-screen').disabled = true;
            navigator.getUserMedia = navigator.mozGetUserMedia || navigator.webkitGetUserMedia;
            navigator.getUserMedia(screen_constraints, function(stream) {
                // share this "MediaStream" object using RTCPeerConnection API
            	// 화면공유를 시작할때
                document.querySelector('#screenvideo').src = URL.createObjectURL(stream);

                stream.oninactive = stream.onended = function() {
                	// 공유를 종료할때
                    document.querySelector('#screenvideo').src = null;
                    document.getElementById('capture-screen').disabled = false;
                };

                document.getElementById('capture-screen').disabled = false;
            }, function(error) {
                console.error('getScreenId error', error);//오류 발생시
                alert('Failed to capture your screen. Please check Chrome console logs for further information.');
            });
        });
	}
	/*
	//이거 어떻게 하지
	var screen_constraints = {
	        mandatory: {
	            chromeMediaSource: DetectRTC.screen.chromeMediaSource,
	            maxWidth: screen.width > 1920 ? screen.width : 1920,
	            maxHeight: screen.height > 1080 ? screen.height : 1080
	            // minAspectRatio: 1.77
	        },
	        optional: [{ // non-official Google-only optional constraints
	            googTemporalLayeredScreencast: true
	        }, {
	            googLeakyBucket: true
	        }]
	    };
	*/
	//채팅방 개설
		// get a local stream
	document.getElementById("join_but").onclick = function () {
		navigator.mediaDevices.getUserMedia({ 
			"audio": true,
			"video": true})//screen_constraints})
			.then(function (stream) {
			// .. show it in a self-view
			selfView.srcObject = stream;
			// .. and keep it to be sent later
			localStream = stream;

			
			selfView.style.visibility = "visible";

			var userId = document.getElementById("session_txt").value;
			signalingChannel = new SignalingChannel(userId);

			// show and update share link
			var link = document.getElementById("share_link");
			var maybeAddHash = window.location.href.indexOf('#') !== -1 ? "" : ("#" + userId);
			link.href = link.textContent = window.location.href + maybeAddHash;
			shareView.style.visibility = "visible";

			callButton.onclick = function () {
				start(true);
			};

			// another peer has joined our session
			signalingChannel.onpeer = function (evt) {
				callButton.disabled = false;
				shareView.style.visibility = "hidden";

				peer = evt.peer;
				peer.onmessage = handleMessage;

				peer.ondisconnect = function () {
					callButton.disabled = true;
					remoteView.style.visibility = "hidden";
					alert('연결 종료');
					if (pc)
						pc.close();
					pc = null;
				};
			};
		}).catch(logError);
	}
		
		if (hash) {
			//start(true);
		}
};

// handle signaling messages received from the other peer
function handleMessage(evt) {
	var message = JSON.parse(evt.data);

	if (!pc && (message.sessionDescription || message.candidate))
		start(false);

	if (message.sessionDescription) {
		pc.setRemoteDescription(new RTCSessionDescription({
			"sdp": SDP.generate(message.sessionDescription),
			"type": message.type
		}), function () {
			// if we received an offer, we need to create an answer
			if (pc.remoteDescription.type == "offer")
				pc.createAnswer(localDescCreated, logError);
		}, logError);
	} else if (!isNaN(message.orientation) && remoteView) {
		var transform = "rotate(" + message.orientation + "deg)";
		remoteView.style.transform = remoteView.style.webkitTransform = transform;
	} else {
		var d = message.candidate.candidateDescription;
		message.candidate.candidate = "candidate:" + [
			d.foundation,
			d.componentId,
			d.transport,
			d.priority,
			d.address,
			d.port,
			"typ",
			d.type,
			d.relatedAddress && ("raddr " + d.relatedAddress),
			d.relatedPort && ("rport " + d.relatedPort),
			d.tcpType && ("tcptype " + d.tcpType)
		].filter(function (x) { return x; }).join(" ");
		pc.addIceCandidate(new RTCIceCandidate(message.candidate), function () {}, logError);
	}
}
var userId;
// call start() to initiate
function start(isInitiator) {	
	callButton.disabled = true;
	pc = new RTCPeerConnection(configuration);
	
	document.getElementById("init-section").style.display= 'none';
	document.getElementById("main-room").style.display= 'block';

	// send any ice candidates to the other peer
	pc.onicecandidate = function (evt) {
		if (evt.candidate) {
			var s = SDP.parse("m=application 0 NONE\r\na=" + evt.candidate.candidate + "\r\n");
			var candidateDescription = s.mediaDescriptions[0].ice.candidates[0];
			peer.send(JSON.stringify({
				"candidate": {
					"candidateDescription": candidateDescription,
					"sdpMLineIndex": evt.candidate.sdpMLineIndex
				}
			}, null, 2));
			console.log("candidate emitted: " + JSON.stringify(candidateDescription, null, 2));
		}
	};

	if (isInitiator) {//채팅을 위한 dataChannel 생성
		channel = pc.createDataChannel("chat");
		setupChat();
	} else { //생성된 dataChannel 사용
		pc.ondatachannel = function (evt) {
			channel = evt.channel;
			setupChat();
		};
	}

	// once the remote stream arrives, show it in the remote video element
	pc.onaddstream = function (evt) {
		remoteView.srcObject = evt.stream;
		if (videoCheckBox.checked)
			remoteView.style.visibility = "visible";
		else if (audioCheckBox.checked && !(chatCheckBox.checked))
			audioOnlyView.style.visibility = "visible";
		sendOrientationUpdate();
	};

	if (audioCheckBox.checked || videoCheckBox.checked) {
		pc.addStream(localStream);
	}

	if (isInitiator)
		pc.createOffer(localDescCreated, logError);

	
}

function localDescCreated(desc) {
	pc.setLocalDescription(desc, function () {
		var sessionDescription = SDP.parse(pc.localDescription.sdp);
		peer.send(JSON.stringify({
			"sessionDescription": sessionDescription,
			"type": pc.localDescription.type
		}, null, 2));
		var logMessage = "localDescription set and sent to peer, type: " + pc.localDescription.type
			+ ", sessionDescription:\n" + JSON.stringify(sessionDescription, null, 2);
		console.log(logMessage);
	}, logError);
}

function sendOrientationUpdate() {
	peer.send(JSON.stringify({ "orientation": window.orientation + 90 }));
}

window.onorientationchange = function () {
	if (peer)
		sendOrientationUpdate();

	if (selfView) {
		var transform = "rotate(" + (window.orientation + 90) + "deg)";
		selfView.style.transform = selfView.style.webkitTransform = transform;
	}
};

function logError(error) {
	if (error) {
		if (error.name && error.message)
			log(error.name + ": " + error.message);
		else
			log(error);
	} else
		log("Error (no error message)");
}

function log(msg) {
	log.div = log.div || document.getElementById("log_div");
	log.div.appendChild(document.createTextNode(msg));
	log.div.appendChild(document.createElement("br"));
}

// setup chat
function setupChat() {
	channel.onopen = function () {
		chatDiv.style.visibility = "visible";
		chatText.style.visibility = "visible";
		chatButton.style.visibility = "visible";
		chatText.disabled = false;
		chatButton.disabled = false;

		//On enter press - send text message.
		chatText.onkeyup = function(event) {
			if (event.keyCode == 13) {//엔터 입력시 메세지전송
				chatButton.click();
			}
		};

		chatButton.onclick = function () {
			if(chatText.value) {
				postChatMessage(chatText.value, true);
				channel.send(/*document.getElementById("user_id").value*/"userId"+": "+chatText.value);//송신메세지
				chatText.value = "";
				chatText.placeholder = "";
			}
		};
	};

	// recieve data from remote user
	channel.onmessage = function (evt) {
		postChatMessage(evt.data);
	};

	function postChatMessage(msg, author) {
		var messageNode = document.createElement('div');
		var messageContent = document.createElement('div');
		messageNode.classList.add('chatMessage');
		messageContent.textContent = msg;
		messageNode.appendChild(messageContent);

		if (author) {
			messageNode.classList.add('selfMessage');
		} else {
			messageNode.classList.add('remoteMessage');
		}

		chatDiv.appendChild(messageNode);
		chatDiv.scrollTop = chatDiv.scrollHeight;
	}
}



