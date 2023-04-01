import UIKit
import MultipeerConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // 创建一个MCAdvertiserAssistant对象来提供对其他设备的广告服务。
    // 这将启动我们的应用程序，以便其他设备可以发现并邀请连接。
    var advertiserAssistant: MCAdvertiserAssistant?
    
    // 创建一个MCNearbyServiceBrowser对象，以便我们可以发现其他设备并邀请它们连接。
    var browser: MCNearbyServiceBrowser?
    
    // 创建一个MCSession对象来管理与其他设备之间的连接。
    var session: MCSession?
    
    // 应用程序启动时调用
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 初始化MCSession对象
        session = MCSession(peer: MCPeerID(displayName: UIDevice.current.name))
        session?.delegate = ChatManager.shared
        
        // 创建一个MCAdvertiserAssistant对象来提供对其他设备的广告服务。
        advertiserAssistant = MCAdvertiserAssistant(serviceType: "chat-service", discoveryInfo: nil, session: session!)
        advertiserAssistant?.start()
        
        // 创建一个MCNearbyServiceBrowser对象，以便我们可以发现其他设备并邀请它们连接。
        browser = MCNearbyServiceBrowser(peer: MCPeerID(displayName: UIDevice.current.name), serviceType: "chat-service")
        browser?.delegate = ChatManager.shared
        browser?.startBrowsingForPeers()
        
        return true
    }
    
    // 应用程序将要进入后台时调用
    func applicationWillResignActive(_ application: UIApplication) {
        // 暂停广告服务
        advertiserAssistant?.stop()
    }
    
    // 应用程序进入后台时调用
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 暂停广告服务
        advertiserAssistant?.stop()
    }
    
    // 应用程序将要进入前台时调用
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 重新开始广告服务
        advertiserAssistant?.start()
    }
    
    // 应用程序恢复时调用
    func applicationDidBecomeActive(_ application: UIApplication) {
        // 重新开始广告服务
        advertiserAssistant?.start()
    }
    
    // 应用程序将要终止时调用
    func applicationWillTerminate(_ application: UIApplication) {
        // 停止广告服务和浏览器
        advertiserAssistant?.stop()
        browser?.stopBrowsingForPeers()
    }
}
