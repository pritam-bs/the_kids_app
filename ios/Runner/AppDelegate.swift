import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flavorChannel = FlutterMethodChannel(name: "space.prtlab.the_kids_app/flavor",
                                              binaryMessenger: controller.binaryMessenger)

    flavorChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "getFlavor" else {
        result(FlutterMethodNotImplemented)
        return
      }

      // Read from a custom build setting
      // 'APP_FLAVOR' is configured in the User-Defined build setting
      if let flavor = Bundle.main.infoDictionary?["APP_FLAVOR"] as? String {
           result(flavor)
      } else {
          // Fallback - e.g., determine from Bundle ID prefix or default
          print("WARNING: APP_FLAVOR not found in Info.plist. Defaulting to 'dev'.")
          result("dev") // Default or error handling
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
