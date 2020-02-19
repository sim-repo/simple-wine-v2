import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    // MARK: - Instance Properties
    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return window
    }()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
    
       // TestData2.shared.start()

        WebsocketService.shared.wsConnect()
        KingfisherConfiguration.shared.setup()

        // bkg update config:
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
    
        return true
    }

    

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Start background fetch
        Setter.shared.bkgAllSync{ (hasNewData) in
            completionHandler(hasNewData ? .newData : .noData)
        }
     }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        MapPresenter.shared.bkgPopToCoverMenuView()
    }
}



extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func postNotification(_ message: String) {
         let content = UNMutableNotificationContent()
         content.title = "Винотека"
         content.body = message
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
         let notification = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)
         UNUserNotificationCenter.current().add(notification)
     }
}
