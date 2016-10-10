
import Foundation
import UIKit

extension UIFont {

    /**
     System Font
     */
    static func system(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    static func systemBold(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    /**
     ヒラギノ角ゴシック
     */
    static func hiraKaku(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W3", size: size)!
    }

    static func hiraKakuBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W6", size: size)!
    }

    /**
     ヒラギノ明朝
     */
    static func hiraMin(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraMinProN-W3", size: size)!
    }

    static func hiraMinBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraMinProN-W6", size: size)!
    }

    /**
     HelveticaNeue
     */
    static func helveticaNeue(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }

    static func helveticaNeueBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }

    static func helveticaNeueLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }

    static func helveticaNeueMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
}
