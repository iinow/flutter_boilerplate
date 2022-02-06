import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let googleMapApiKey = "AIzaSyDqjEcmchbDa3bAcxpWnEqxXk4mRCH3lT0"
    GMSServices.provideAPIKey(googleMapApiKey)
    GMSPlacesClient.provideAPIKey(googleMapApiKey)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
