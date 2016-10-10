
import UIKit
import SwiftEssential

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configure()

        let vc = ViewController.init()
        let navi = window?.rootViewController as! UINavigationController
        navi.pushViewController(vc, animated: false)

        return true
    }

    fileprivate func configure() {
        Appearance.configure()
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - LifeCycle
    // -----------------------------------------------------------------------------

    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - Rotation
    // -----------------------------------------------------------------------------

    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
}
