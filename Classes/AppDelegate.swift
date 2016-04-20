
import UIKit
import Flurry_iOS_SDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        configureLibraries()

        let vc = ViewController.init()
        let navi = window?.rootViewController as! UINavigationController
        navi.pushViewController(vc, animated: false)
        
        setAppearance()
        return true
    }

    private func configureLibraries() {
        Flurry.startSession(Constant.flurryId())

        // Google Analytics
        let gai = GAI.sharedInstance()
        gai.trackerWithTrackingId(Constant.googleAnalyticsId())
        gai.trackUncaughtExceptions = false
        gai.dispatchInterval = 60 * 5
        gai.logger.logLevel = GAILogLevel.None
#if DEBUG
        gai.dryRun = true
        gai.logger.logLevel = GAILogLevel.Info
#endif
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - LifeCycle
    // -----------------------------------------------------------------------------

    
    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - Rotation
    // -----------------------------------------------------------------------------

    
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
//        if(Device.isPad()){
//            return UIInterfaceOrientationMask.All
//        }
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    // -----------------------------------------------------------------------------
    // MARK: - Appearance
    // -----------------------------------------------------------------------------

    
    func setAppearance() {
        let mainColor = UIColor.blueColor()
        
        let attr1 = [ NSFontAttributeName : UIFont.systemFontOfSize(18),
                      NSForegroundColorAttributeName : mainColor]
        
        let attr2 = [ NSFontAttributeName : UIFont.systemFontOfSize(15),
                      NSForegroundColorAttributeName : mainColor]

        let navibar = UINavigationBar.appearance()
        navibar.setBackgroundImage(UIImage.init(named: "bar64"), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        navibar.shadowImage = UIImage()
        navibar.translucent = false
        navibar.tintColor = mainColor
        navibar.titleTextAttributes = attr1
        
        let toolbar = UIToolbar.appearance()
        toolbar.setBackgroundImage(UIImage.init(named: "bar44"), forToolbarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        toolbar.setShadowImage(UIImage(), forToolbarPosition: UIBarPosition.Any)
        toolbar.translucent = false
        
        let button = UIBarButtonItem.appearance()
        button.setTitleTextAttributes(attr2, forState: UIControlState.Normal)
        button.setTitleTextAttributes(attr2, forState: UIControlState.Highlighted)
    }
    
}