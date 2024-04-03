import UIKit
import Flutter
import ZohoDeskPortalAPIKit
import Swift
import ZohoDeskPortalConfiguration


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        enablePushNotifications(application)
        GeneratedPluginRegistrant.register(with: self)

        ZDPThemeManager.updateLightTheme(theme: ThemeColorsLight.shared) // Updating the Light Theme Colours
        ZDPThemeManager.updateDarkTheme(theme: ThemeColorsDark.shared) // Updating the Dark Theme Colours
        ZDPortalConfiguration.modalPresentationStyle = .overFullScreen // Setting the Presentation style to occupy the full screen
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Refer this method for enabling push notification
    override func application(_ application: UIApplication,didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.reduce("", {$0 + String(format: "%02X", $1)}).uppercased()
        ZohoDeskPortalKit.enablePushNotifications(deviceToken: token, mode: .sandbox)
    }

    // Refer this method for handling the received push notification
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        ZDPortalConfiguration.processRemoteNotification(userInfo: response.notification.request.content.userInfo)
        completionHandler()
    }

    func enablePushNotifications(_ application: UIApplication){
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (_, _) in }
        application.registerForRemoteNotifications()
    }

}

class ThemeColorsLight: ZDPThemeProtocol { // Define your Light Mode Theme Here
    
    private init() {}
    
    public static var shared: ZDPThemeProtocol = ThemeColorsLight()
    
    var navigationBarBackgroundColor: UIColor {
        UIColor(hexCode: navBarBackgroundColor)
    }
    
    var themeColor: UIColor {
        UIColor(hexCode: themeColorString)
    }
    
    @Published var navBarBackgroundColor: String = "#673AB7"
    @Published var themeColorString: String = "#673AB7"
}

class ThemeColorsDark: ZDPThemeProtocol { // Define your Dark Mode Theme Here
    
    private init() {}
    
    public static var shared: ZDPThemeProtocol = ThemeColorsDark()
    
    var navigationBarBackgroundColor: UIColor {
        UIColor(hexCode: navBarBackgroundColor)
    }
    
    var themeColor: UIColor {
        UIColor(hexCode: themeColorString)
    }
    
    @Published var navBarBackgroundColor: String = "#7E57C2"
    @Published var themeColorString: String = "#7E57C2"
}

