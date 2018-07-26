import UIKit

private var isFontLoaded = false

public extension UIFont {
    public static func googleMDIcon(of size: CGFloat) -> UIFont {
        let fileName: String = "MaterialIcons"
        let fontName: String = "MaterialIcons-Regular"
        
        if UIFont.fontNames(forFamilyName: fontName).isEmpty {
            DispatchQueue.once(token: "com.pxlborn.googlemd-icons") {
                FontLoader.loadFont(name: fileName)
            }
        }
        
        guard let font = UIFont(name: fontName, size: size) else {
            fatalError("\(fontName) not found")
        }
        
        return font
    }
}

public extension UIImage {
     public static func googleMDIcon(icon type: GoogleMDIconType, size: CGSize, color: UIColor = .black) -> UIImage {
        let fileName: String = "MaterialIcons"
        let fontName: String = "MaterialIcons-Regular"
        
        FontLoader.loadFont(name: fileName)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let mdFont = UIFont(name: fontName, size: fontSize)
        let attributes = [
            NSAttributedStringKey.font: mdFont!,
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.paragraphStyle: paragraph]
        let lineHeight = mdFont!.lineHeight
        let attributedString = NSAttributedString(string: type.text!, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - lineHeight) * 0.5, width: size.width, height: lineHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

public extension UIImageView {
    public class func googleMDIcon(icon type: GoogleMDIconType, size: CGSize, color: UIColor = .black) -> UIImageView {
        
        return UIImageView(image: UIImage.googleMDIcon(icon: type, size: size, color: color))
    }
}

//public extension UILabel {
//    public static func googleMDIcon(icon type: GoogleMDIconType, size: CGFloat, color: UIColor = .black) -> UILabel {
//        let fileName: String = "MaterialIcons"
//        let fontName: String = "MaterialIcons-Regular"
//
//        FontLoader.loadFont(name: fileName)
//
//        let label = UILabel()
//        let mdFont = UIFont(name: fontName, size: size)
//        label.text = type.text
//        label.font = mdFont
//        label.textColor = color
//        label.textAlignment = .center
//
//        return label
//    }
//}

private class FontLoader {
    class func loadFont(name: String) {
        let bundle = Bundle(for: FontLoader.self)
        let identifier = bundle.bundleIdentifier
        
        if !isFontLoaded {
            let url: URL?
            let fileExtension = "ttf"
            
            if identifier?.hasPrefix("org.cocoapods") == true {
                url = bundle.url(forResource: name, withExtension: fileExtension, subdirectory: "GoogleMD-Icons.bundle")!
            } else {
                url = bundle.url(forResource: name, withExtension: fileExtension)!
            }
            
            guard let fontURL = url else { fatalError("\(name) not found in bundle") }
            
            guard let data = NSData(contentsOf: fontURL), let provider = CGDataProvider(data: data) else { return }
            let font = CGFont(provider)
            
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font!, &error) {
                let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
                let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
                NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
            } else {
                isFontLoaded = true
            }
        }
    }
}

public extension DispatchQueue {
    private static var _onceTracker = [String]()

    public class func once(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
