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
      GeneratedPluginRegistrant.register(with: self)
      
     ZDPThemeManager.updateLightTheme(theme: ThemeColors.shared)
     ZDPThemeManager.updateDarkTheme(theme: ThemeColorsDark.shared)
    
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class ThemeColors: ZDPThemeProtocol {
    
    private init() {}
    
    public static var shared: ZDPThemeProtocol = ThemeColors()
    
    var navigationBarBackgroundColor: UIColor {
        UIColor(hexCode: navBarBackgroundColor)
    }
    
    var themeColor: UIColor {
        UIColor(hexCode: themeColorString)
    }
    
    @Published var navBarBackgroundColor: String = "#673AB7"
    @Published var themeColorString: String = "#673AB7"
}

class ThemeColorsDark: ZDPThemeProtocol {
    
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

