import Starscream

class WebsocketService: WebSocketDelegate {
    
    private init(){}
    static var shared = WebsocketService()
    
    var timer: Timer?

    lazy var socket = WebSocket(url: URL(string: NetworkConfiguration.wsBasePath + "/")!, protocols: ["chat"])
    
    func wsConnect() {
        socket.delegate = self
        socket.connect()
    }
    
    @objc func fireConnect(timer: Timer) {
         socket.connect()
         timer.invalidate()
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {}

    func websocketDidConnect(socket: WebSocketClient) {
        socket.write(string: "SIMPLE")
        log("connected", level: .warning)
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        log("disconnected", level: .warning)
        timer = Timer.scheduledTimer(timeInterval: NetworkConfiguration.intervalBetweenRetryConnect, target: self, selector: #selector(fireConnect), userInfo: nil, repeats: true)
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        // 1
        guard let data = text.data(using: .utf16),
            let jsonData = try? JSONSerialization.jsonObject(with: data),
            let jsonDict = jsonData as? [String: Any],
            let messageType = jsonDict["type"] as? String else {
                return
        }

        // 2
        if messageType == "message",
            let messageData = jsonDict["data"] as? [String: Any],
            let messageText = messageData["text"] as? String {
            
            if messageText == "images.cache.clear" {
                KingfisherConfiguration.shared.clearCache()
                print("images.cache.clear")
            }
        }
    }
    
    
    private func log(_ msg: String, level: Logger.LogLevelEnum) {
        Logger.log(clazz: "WebsocketService", msg, level: level, printEnum: .websocket)
    }
}
