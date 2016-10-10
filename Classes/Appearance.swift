
import Foundation
import SwiftEssential

class Appearance {

    class func configure() {
        navibar()
    }

    fileprivate class func navibar() {
        let navibar = UINavigationBar.appearance()
        navibar.barTintColor = UIColor.navibarBarTint
        navibar.tintColor = UIColor.navibarTint
        navibar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navibar.shadowImage = UIImage()
        navibar.isTranslucent = false

        let attr = [ NSFontAttributeName : UIFont.systemBold(19),
                     NSForegroundColorAttributeName : navibar.tintColor] as [String : Any]
        navibar.titleTextAttributes = attr
    }
}
