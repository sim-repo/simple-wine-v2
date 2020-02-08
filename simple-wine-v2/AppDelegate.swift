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
        
        Setter.shared.allSync()
        
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
}




extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func postNotification(_ message: String) {

         // if background fetch, let the user know that there's data for them

         let content = UNMutableNotificationContent()
         content.title = "MyApp"
         content.body = message
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
         let notification = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)
         UNUserNotificationCenter.current().add(notification)
     }
}
