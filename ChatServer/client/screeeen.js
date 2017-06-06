 // todo: need to check exact chrome browser because opera also uses chromium framework
var isChrome = !!navigator.webkitGetUserMedia;

// DetectRTC.js - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/DetectRTC
// Below code is taken from RTCMultiConnection-v1.8.js (http://www.rtcmulticonnection.org/changes-log/#v1.8)
var DetectRTC = {}; //class 처럼 생성하여 각 function에 접근

(function () {

    var screenCallback;

    DetectRTC.screen = {
    chromeMediaSource: 'screen',
        getSourceId: function(callback) {
            if(!callback) throw '"callback" parameter is mandatory.';
            screenCallback = callback;
            window.postMessage('get-sourceId', '*');
        },
        isChromeExtensionAvailable: function(callback) {
            if(!callback) return;

            if(DetectRTC.screen.chromeMediaSource == 'desktop') return callback(true);

            // ask extension if it is available
            window.postMessage('are-you-there', '*');

            setTimeout(function() {
                if(DetectRTC.screen.chromeMediaSource == 'screen') {
                    callback(false);
                }
                else callback(true);
            }, 2000);
        },
        onMessageCallback: function(data) {
            if (!(typeof data == 'string' || !!data.sourceId)) return;

            console.log('chrome message', data);

            // "cancel" button is clicked
            if(data == 'PermissionDeniedError') {
                DetectRTC.screen.chromeMediaSource = 'PermissionDeniedError';
                if(screenCallback) return screenCallback('PermissionDeniedError');
                else throw new Error('PermissionDeniedError');
            }

            // extension notified his presence
            if(data == 'rtcmulticonnection-extension-loaded') {
                if(document.getElementById('install-button')) {
                    document.getElementById('install-button').parentNode.innerHTML = '<strong>ffffff</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
                }
                DetectRTC.screen.chromeMediaSource = 'desktop';
            }

            // extension shared temp sourceId
            if(data.sourceId) {
                DetectRTC.screen.sourceId = data.sourceId;
                if(screenCallback) screenCallback( DetectRTC.screen.sourceId );
            }
        },
        getChromeExtensionStatus: function (callback) {//확장 프로그램 설치여부 확인
            if (!!navigator.mozGetUserMedia) return callback('not-chrome');

            var extensionid = 'ajhifddimkapgcifgcodmmfdlknahffk';

            var image = document.createElement('img');
            image.src = 'chrome-extension://' + extensionid + '/icon.png';
            image.onload = function () {
                DetectRTC.screen.chromeMediaSource = 'screen';
                window.postMessage('are-you-there', '*');
                setTimeout(function () {
                    if (!DetectRTC.screen.notInstalled) {
                        callback('installed-enabled');
                    }
                }, 2000);
            };
            image.onerror = function () {
                DetectRTC.screen.notInstalled = true;
                callback('not-installed');
            };
        }
    };

    // check if desktop-capture extension installed.
    if(window.postMessage && isChrome) {
        DetectRTC.screen.isChromeExtensionAvailable();
    }
})();

DetectRTC.screen.getChromeExtensionStatus(function(status) {//설치 여부에 따라 반환해주는 status로 구분하여 버튼 변경
    if(status == 'installed-enabled') {
        document.getElementById('share-screen').disabled = false;
        document.getElementById('share-screen').style.display = "inline";
        document.getElementById('install-button').disabled = false;
        document.getElementById('install-button').style.display = "none";
        DetectRTC.screen.chromeMediaSource = 'desktop';
    }
});

window.addEventListener('message', function (event) {
    if (event.origin != window.location.origin) {
        return;
    }

    DetectRTC.screen.onMessageCallback(event.data);
});

console.log('current chromeMediaSource', DetectRTC.screen.chromeMediaSource);

document.getElementById('share-screen').onclick = function() {
    //var roomName = document.getElementById('room-name') || { };
    //roomName.disabled = true;
    captureUserMedia(function() {
        conferenceUI.createRoom({
            roomName: (/* roomName.value */'aa' || 'Anonymous') + ' shared his screen with you'
        });
    });
    //this.disabled = true;
};

function captureUserMedia(callback, extensionAvailable) {
    console.log('captureUserMedia chromeMediaSource', DetectRTC.screen.chromeMediaSource);

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

    // for non-www.webrtc-experiment.com domains
    if(isChrome && !DetectRTC.screen.sourceId) {
        window.addEventListener('message', function (event) {
            if (event.data && event.data.chromeMediaSourceId) {
                var sourceId = event.data.chromeMediaSourceId;

                DetectRTC.screen.sourceId = sourceId;
                DetectRTC.screen.chromeMediaSource = 'desktop';

                if (sourceId == 'PermissionDeniedError') {
                    return alert('User denied to share content of his screen.');
                }

                captureUserMedia(callback, true);
            }

            if (event.data && event.data.chromeExtensionStatus) {
                warn('Screen capturing extension status is:', event.data.chromeExtensionStatus);
                DetectRTC.screen.chromeMediaSource = 'screen';
                captureUserMedia(callback, true);
            }
        });
        screenFrame.postMessage();
        return;
    }

    if(isChrome && DetectRTC.screen.chromeMediaSource == 'desktop') {
        screen_constraints.mandatory.chromeMediaSourceId = DetectRTC.screen.sourceId;
    }

    var constraints = {
        audio: false,
        video: screen_constraints//이미지 대신 화면을 줌 > true
    };
/*
    if(!!navigator.mozGetUserMedia) {
        console.warn(Firefox_Screen_Capturing_Warning);
        constraints.video = {
            mozMediaSource: 'window',
            mediaSource: 'window',
            maxWidth: 1920,
            maxHeight: 1080,
            minAspectRatio: 1.77
        };
    }
*/
    console.log( JSON.stringify( constraints , null, '\t') );

    var video = document.createElement('video');
    video.style.visibility = "visible";
    video.setAttribute('autoplay', true);
    video.setAttribute('controls', true);
    videosContainer.insertBefore(video, videosContainer.firstChild);
    
    navigator.mediaDevices.getUserMedia({
        video: video,
        constraints: constraints,
        onsuccess: function(stream) {
            config.attachStream = stream;
            callback && callback();

            video.setAttribute('muted', true);
        },
        onerror: function() {
            if(isChrome) {
                alert('Screen capturing is either denied or not supported. Please install chrome extension for screen capturing or run chrome with command-line flag: --enable-usermedia-screen-capturing');
            }
        }
    });
}
var screenFrame, loadedScreenFrame;
var videosContainer = document.getElementById("videos-container")

function loadScreenFrame(skip) {
    if(loadedScreenFrame) return;
    if(!skip) return loadScreenFrame(true);

    loadedScreenFrame = true;

    var iframe = document.createElement('iframe');
    iframe.onload = function () {
        iframe.isLoaded = true;
        console.log('Screen Capturing frame is loaded.');

        //document.getElementById('room-name').disabled = false;
    };
    iframe.src = 'https://www.webrtc-experiment.com/getSourceId/';
    iframe.style.display = 'none';
    (document.body || document.documentElement).appendChild(iframe);

    screenFrame = {
        postMessage: function () {
            if (!iframe.isLoaded) {
                setTimeout(screenFrame.postMessage, 100);
                return;
            }
            console.log('Asking iframe for sourceId.');
            iframe.contentWindow.postMessage({
                captureSourceId: true
            }, '*');
        }
    };
};

loadScreenFrame();

                